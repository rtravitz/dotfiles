require('plug')
require('lsp')
require('maps')

vim.o.shortmess = 'It'
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.hidden = true
vim.o.lazyredraw = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.timeout = false
vim.o.ttimeoutlen = 10
vim.o.mouse = 'a'
vim.o.termguicolors = true
vim.o.swapfile = false

vim.wo.number = true
vim.wo.wrap = false

vim.bo.expandtab = true

vim.cmd('colorscheme OceanicNext')
vim.cmd [[
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smartindent
]]

vim.g.NERDTreeShowHidden = 1
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.g.completion_enable_auto_signature = 0

-- keep panes split at equal sizes
vim.api.nvim_command('augroup pane_splits')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd VimResized * wincmd =')
vim.api.nvim_command('augroup END')

