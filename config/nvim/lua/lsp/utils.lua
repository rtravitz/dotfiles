local M = {}

M.on_attach = function(client, bufnr)
  -- Keybindings for LSPs
  vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>lua vim.lsp.buf.diagnostic.goto_prev()<cr>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua vim.lsp.buf.diagnostic.goto_next()<cr>', {noremap = true, silent = true})
end

return M
