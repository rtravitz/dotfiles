local opt = vim.opt

opt.shortmess = 'It'
opt.splitright = true
opt.splitbelow = true
opt.hidden = true
opt.lazyredraw = true
opt.ignorecase = true
opt.smartcase = true
opt.timeout = false
opt.ttimeoutlen = 10
opt.mouse = 'a'
opt.termguicolors = true
opt.swapfile = false

opt.number = true
opt.wrap = false

opt.expandtab = true

opt.laststatus = 3

opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.smartindent = true

vim.cmd 'colorscheme OceanicNext'
vim.cmd 'highlight WinSeparator guibg=None'

vim.g.NERDTreeShowHidden = 1
opt.completeopt = 'menuone,noinsert,noselect'
vim.g.completion_enable_auto_signature = 0

