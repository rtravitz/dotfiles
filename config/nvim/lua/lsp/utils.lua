local M = {}

M.on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  buf_set_keymap('n', '<C-n>', '<cmd>lua vim.lsp.buf.diagnostic.goto_prev()<cr>', opts)
  buf_set_keymap('n', '<C-p>', '<cmd>lua vim.lsp.buf.diagnostic.goto_next()<cr>', opts)
  buf_set_keymap('n', '<leader>l', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)

  require('completion').on_attach()
end

return M
