return {
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'tpope/vim-fugitive',
  'wavded/vim-stylus',
  'nvim-lua/plenary.nvim',
  'christoomey/vim-tmux-navigator',
  'preservim/nerdcommenter',
  {
    'iamcco/markdown-preview.nvim',
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}
