return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ':TSUpdate',
    opts = {
      ignore_install = { 'phpdoc', 'ipkg' },
      highlight = { enable = true },
      indent = { enable = false },
    }
  }
}
