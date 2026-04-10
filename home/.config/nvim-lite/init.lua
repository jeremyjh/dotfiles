require("config.lazy")

vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

vim.g.mapleader = ' '

-- window management (spacemacs SPC w)
vim.keymap.set('n', '<Leader>wv', '<C-W>v', { desc = 'Split vertical' })
vim.keymap.set('n', '<Leader>ws', '<C-W>s', { desc = 'Split horizontal' })
vim.keymap.set('n', '<Leader>wd', '<C-W>c', { desc = 'Close window' })
vim.keymap.set('n', '<Leader>wh', function() vim.cmd('wincmd h') end, { desc = 'Go to left window' })
vim.keymap.set('n', '<Leader>wj', function() vim.cmd('wincmd j') end, { desc = 'Go to window below' })
vim.keymap.set('n', '<Leader>wk', function() vim.cmd('wincmd k') end, { desc = 'Go to window above' })
vim.keymap.set('n', '<Leader>wl', function() vim.cmd('wincmd l') end, { desc = 'Go to right window' })
vim.keymap.set('n', '<Leader>wm', function()
  if vim.t.maximized then
    vim.cmd('wincmd =')
    vim.t.maximized = false
  else
    vim.cmd('wincmd _')
    vim.cmd('wincmd |')
    vim.t.maximized = true
  end
end, { desc = 'Toggle maximize window' })

-- save / quit
vim.keymap.set('n', '<Leader>fs', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<Leader>qa', ':qa<CR>')

-- exit insert mode
vim.keymap.set('i', 'jk', '<Esc>')

-- settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.number = true
vim.opt.wrap = false
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.laststatus = 2
vim.opt.encoding = 'utf-8'

-- colorscheme loaded via plugins/colorscheme.lua

-- strip trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd('%s/\\s\\+$//e')
    vim.api.nvim_win_set_cursor(0, pos)
  end,
})

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}
