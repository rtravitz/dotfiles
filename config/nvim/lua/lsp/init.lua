local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  -- Keybindings for LSPs
  vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>lua vim.lsp.buf.diagnostic.goto_prev()<cr>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua vim.lsp.buf.diagnostic.goto_next()<cr>', {noremap = true, silent = true})
end

lspconfig.tsserver.setup{
  on_attach = on_attach,
}

lspconfig.gopls.setup{
  on_attach = on_attach,
}

-- someday augroups will be implemented
-- vim.api.nvim_command([[
-- augroup jdtls_lsp
--   autocmd!
--   autocmd FileType java lua require('lsp.jdtls').setup()
-- augroup END
-- ]])

vim.api.nvim_command('augroup jdtls_lsp')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command("autocmd FileType java lua require('lsp.jdtls').setup()")
vim.api.nvim_command('augroup end')
