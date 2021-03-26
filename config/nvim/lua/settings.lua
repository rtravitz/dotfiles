local g = vim.o
local w = vim.wo
local b = vim.bo

g.shortmess = 'It'
g.splitright = true
g.splitbelow = true
g.hidden = true
g.lazyredraw = true
g.ignorecase = true
g.smartcase = true
g.timeout = false
g.ttimeoutlen = 10
g.mouse = 'a'
g.termguicolors = true

w.number = true
w.wrap = false

b.swapfile = false
b.tabstop = 2
b.shiftwidth = 2
b.softtabstop = 2
b.expandtab = true
-- b.filetype = 'plugin indent on'
