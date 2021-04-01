local lspconfig = require('lspconfig')
local utils = require('lsp.utils')

lspconfig.gopls.setup{
  on_attach = utils.on_attach,
}

