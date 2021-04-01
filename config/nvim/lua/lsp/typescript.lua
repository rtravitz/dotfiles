local utils = require('lsp.utils')
local lspconfig = require('lspconfig')

lspconfig.tsserver.setup{
  on_attach = utils.on_attach,
}

