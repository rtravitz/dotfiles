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

local function setup_server(server, override_opts)
  local opts = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = on_attach,
  }

  if override_opts ~= nil then
    for key, value in pairs(override_opts) do
      opts[key] = value
    end
  end

  vim.lsp.config(server, opts)
  vim.lsp.enable(server)
end

setup_server('gopls')
setup_server('clangd')
setup_server('bashls')
setup_server('denols', { root_markers = {'deno.json', 'deno.jsonc'} })
setup_server('ts_ls', { root_markers = {'package.json'} })
setup_server('eslint', {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    local keymap_opts = { noremap=true, silent=true, buffer = bufnr }
    vim.keymap.set('n', '<space>af', '<cmd>EslintFixAll<cr>', keymap_opts)
  end,
})
setup_server('lua_ls', {
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
})
