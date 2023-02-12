return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      {
        'williamboman/mason-lspconfig.nvim',
        opts = function()
          local servers = { 'clangd', 'tsserver', 'sumneko_lua', 'gopls', 'eslint' }

          return {
            ensure_installed = servers
          }
        end
      },
      {
        'j-hui/fidget.nvim',
        config = function()
          require('fidget').setup()
        end
      },
    },
  },
}
