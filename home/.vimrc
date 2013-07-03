call pathogen#infect()
syntax on
filetype plugin indent on

"highlight characters past column 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%>80v.\+/

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-s> :w<CR>
map <RightMouse> gf
imap <RightMouse> <Esc> gf 
imap <C-s> <Esc> :w <CR>
map <C-t> :FuzzyFinderTextMate<CR>
map <C-b> :FuzzyFinderBuffer<CR>
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

:let g:NERDTreeIgnore=['\.sock', '\.o', '\.hi', '\.beam']
let g:fuzzy_ignore = "*.log, *.sock, *.o, *.hi, *.beam"
let g:fuzzy_matching_limit = 70

autocmd vimenter * if !argc() | NERDTree | endif
imap jk <Esc>

if has("gui_running")
  set background=dark
  colorscheme desert
  set gfn=Source\ Code\ Pro\ 9
  set lines=40 columns=150
else
  colorscheme elflord
endif

set foldmethod=manual
set nowrap
set mouse=a
syntax enable
let g:slime_target="tmux"
set number

set pastetoggle=<F2>
map <F5>  :w <Bar> :SlimuxShellLast<CR>
imap <F5> <Esc> :w <Bar> :SlimuxShellLast<CR>

map <F7> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>
" fix coffeescript tab/spacing
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

"these 3 needed for Powerline
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_colorscheme = 'solarized'

"nmap <C-m> ggVG<C-c><C-c> `.
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>
nmap <C-m> mzggVG :SlimuxREPLSendSelection<CR> 'z

" disable swap & backup files
set noswapfile
set nobackup
" Tagbar uses ctags-exuberant by default but
" this isn't a default target if ctags is built from source
" which is needed for Ruby rspec support
" Tagbar language definitions
let g:tagbar_ctags_bin="ctags" 
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'Elixir',
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:impls',
        \ 'a:macros',
        \ 'f:functions',
        \ 'o:operators',
        \ 'p:protocols',
        \ 'r:records'
    \ ]
\ }

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
    \ }
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '--include-vars',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

if executable('lushtags')
    let g:tagbar_type_haskell = {
        \ 'ctagsbin' : 'lushtags',
        \ 'ctagsargs' : '--ignore-parse-error --',
        \ 'kinds' : [
            \ 'm:module:0',
            \ 'e:exports:1',
            \ 'i:imports:1',
            \ 't:declarations:0',
            \ 'd:declarations:1',
            \ 'n:declarations:1',
            \ 'f:functions:0',
            \ 'c:constructors:0'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 'd' : 'data',
            \ 'n' : 'newtype',
            \ 'c' : 'constructor',
            \ 't' : 'type'
        \ },
        \ 'scope2kind' : {
            \ 'data' : 'd',
            \ 'newtype' : 'n',
            \ 'constructor' : 'c',
            \ 'type' : 't'
        \ }
    \ }
endif


"hacking this in here - access Elixir REPL help from VIM!
function! s:GetVisual() range
    let reg_save = getreg('"')
    let regtype_save = getregtype('"')
    let cb_save = &clipboard
    set clipboard&
    silent normal! ""gvy
    let selection = getreg('"')
    call setreg('"', reg_save, regtype_save)
    let &clipboard = cb_save
    return selection
endfunction
command! -range=% -bar -nargs=* SlimuxREPLSendHelp call SlimuxSendCode("h(" . s:GetVisual() . ")\n")


vmap <F1> <Esc>:SlimuxREPLSendHelp<CR>
au Filetype elixir vmap <F1> <Esc>:SlimuxREPLSendHelp<CR>
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

"put the hdevtools socket in /tmp so it doesn't mess with NERDTree
let g:hdevtools_options="-g-isrc --socket=/tmp/hdevtools-" . join(split($PWD,"\/"),"-") . "\.sock"

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,ruby,python,elixir,haskell,erlang autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

