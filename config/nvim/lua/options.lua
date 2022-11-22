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

opt.completeopt = 'menuone,noinsert,noselect'
vim.g.completion_enable_auto_signature = 0

vim.cmd [[
  let g:oceanic_next_terminal_bold = 1
  let g:oceanic_next_terminal_italic = 1
  colorscheme OceanicNext
  hi Normal guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
  hi WinSeparator guibg=NONE ctermbg=NONE
]]

vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'None' })


