return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
    opts = {
      ensure_installed = 'all',
      -- https://github.com/claytonrcarter/tree-sitter-phpdoc/issues/15
      ignore_install = { 'phpdoc', 'ipkg' },
      highlight = { enable = true },
      indent = { enable = false },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<c-backspace>',
        },
      },
    }
  }
}
