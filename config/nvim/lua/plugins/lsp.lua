return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'j-hui/fidget.nvim',
        config = function()
          require('fidget').setup({})
        end,
      },
    },
  },
  {
    'williamboman/mason.nvim',
    build = ":MasonUpdate",
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'clangd',
        'ts_ls',
        'lua_ls',
        'gopls',
        'eslint',
        'bashls',
      }
    },
  },
}
