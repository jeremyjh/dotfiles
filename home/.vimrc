call pathogen#infect()
syntax on
filetype plugin indent on
map <C-j> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-h> <C-W>h<C-W>_
map <C-l> <C-W>l<C-W>_
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
let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 70
autocmd vimenter * if !argc() | NERDTree | endif
imap jk <Esc>
if has("gui_running")
  set lines=40 columns=150
  set background=light
  colorscheme solarized
else
  set background=dark
  colorscheme elflord
endif
set foldmethod=syntax
set nowrap
set mouse=a
syntax enable
let g:slime_target="tmux"
set number

map <F5>  :w <Bar> call VimuxRunLastCommand()<CR>
imap <F5> <Esc> :w <Bar> call VimuxRunLastCommand()<CR>
map <F7> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>
" fix coffeescript tab/spacing
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

"these 3 needed for Powerline
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_colorscheme = 'solarized'

nmap <C-m> ggVG<C-c><C-c> `.

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
