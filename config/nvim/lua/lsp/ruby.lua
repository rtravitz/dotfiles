local utils = require('lsp.utils')

require'lspconfig'.solargraph.setup{
  on_attach = utils.on_attach,
  settings = {
    solargraph = {
      diagnostics = true
    }
  }
}
