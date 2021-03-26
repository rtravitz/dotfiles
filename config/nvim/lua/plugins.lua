vim.cmd 'packadd paq-nvim'         -- Load package
local paq = require'paq-nvim'.paq  -- Import module and bind `paq` function
paq{'savq/paq-nvim', opt=true}     -- Let Paq manage itself

paq 'christoomey/vim-tmux-navigator'
paq {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}  
paq 'junegunn/fzf'
paq 'junegunn/fzf.vim'
paq 'mhartington/oceanic-next'
paq 'neovim/nvim-lspconfig'
paq {'nvim-treesitter/nvim-treesitter'}
paq 'scrooloose/nerdcommenter'
paq 'scrooloose/nerdtree'
paq 'segeljakt/vim-silicon'
paq 'tpope/vim-markdown'
paq 'tpope/vim-repeat'
paq 'tpope/vim-surround'
paq 'tpope/vim-fugitive'
paq 'tpope/vim-rhubarb'
paq 'tpope/vim-tbone'
paq 'wbthomason/packer.nvim'
paq 'hrsh7th/nvim-compe'
