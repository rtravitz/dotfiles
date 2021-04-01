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

-- tapstop, shiftwidth, and softabstop are global here even though
-- they show as buffer options in the help text
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

vim.wo.number = true
vim.wo.wrap = false

vim.bo.swapfile = false
vim.bo.expandtab = true

vim.cmd('colorscheme OceanicNext')

vim.g.NERDTreeShowHidden = 1

-- keep panes split at equal sizes
vim.api.nvim_command('augroup pane_splits')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd VimResized * wincmd =')
vim.api.nvim_command('augroup END')

