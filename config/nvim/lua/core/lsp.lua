local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function on_attach(client, bufnr)
  local function nmap(key, action)
    local opts = { noremap=true, silent=true, buffer = bufnr }
    vim.keymap.set('n', key, action, opts)
  end
  local function vmap(key, action)
    local opts = { noremap=true, silent=true, buffer = bufnr }
    vim.keymap.set('v', key, action, opts)
  end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  nmap('gd', vim.lsp.buf.definition)
  nmap('gt', vim.lsp.buf.type_definition)
  nmap('gi', vim.lsp.buf.implementation)
  nmap('gr', vim.lsp.buf.references)
  nmap('K', vim.lsp.buf.hover)
  --nmap('<C-k>', vim.lsp.buf.signature_help)
  nmap('<space>rn', vim.lsp.buf.rename)
  nmap('<space>ca', vim.lsp.buf.code_action)
  nmap('<space>f', vim.lsp.buf.format)
  vmap('<space>f', vim.lsp.buf.format)

  -- diagnostic
  nmap('<space>e', vim.diagnostic.open_float)
  nmap('<space>dj', vim.diagnostic.goto_next)
  nmap('<space>dk', vim.diagnostic.goto_prev)
end

local servers = { 'gopls', 'ts_ls', 'clangd', 'bashls' }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

require'lspconfig'.eslint.setup{
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    local opts = { noremap=true, silent=true, buffer = bufnr }
    vim.keymap.set('n', '<space>af', '<cmd>EslintFixAll<cr>', opts)
  end,
  flags = {
    debounce_text_changes = 150,
  }
}

require'lspconfig'.lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
  }
)
