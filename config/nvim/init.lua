require('plugins')
require('settings')
require('maps')
require('lsp')
require('plugins.compe')

local cmd = vim.cmd
-- vim.cmd('source ~/.config/nvim/vimscript/init.vim')
-- b.filetype = 'plugin indent on'
cmd('colorscheme OceanicNext')

local cmd = vim.cmd
-- cmd([[
-- augroup pane_splits
--   autocmd!
--   autocmd VimResized * wincmd = "keep pane splits equal sizes
-- augroup END
-- ]])

local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}
