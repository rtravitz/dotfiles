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
vim.wo.wrap = false

opt.expandtab = true

opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.smartindent = true

opt.completeopt = 'menuone,noinsert,noselect'
vim.g.completion_enable_auto_signature = 0

vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'None' })


