vim.cmd 'packadd paq-nvim'         -- Load package
local paq = require'paq-nvim'.paq  -- Import module and bind `paq` function
paq{'savq/paq-nvim', opt=true}     -- Let Paq manage itself

paq 'christoomey/vim-tmux-navigator'
paq {'iamcco/markdown-preview.nvim', run = function() vim.cmd('mkdp#util#install()') end}
paq 'mfussenegger/nvim-jdtls'
paq 'mfussenegger/nvim-dap'
paq 'mhartington/oceanic-next'
paq 'neovim/nvim-lspconfig'

-- Telescope
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim'

paq 'nvim-treesitter/nvim-treesitter'
paq 'scrooloose/nerdcommenter'
paq 'scrooloose/nerdtree'
paq 'segeljakt/vim-silicon'
paq 'tpope/vim-markdown'
paq 'tpope/vim-repeat'
paq 'tpope/vim-surround'
paq 'tpope/vim-fugitive'
paq 'tpope/vim-rhubarb'
paq 'tpope/vim-tbone'
paq 'hrsh7th/nvim-compe'

-- Configuration files for specific plugins
require('plugins.compe')
require('plugins.telescope')
