local group = vim.api.nvim_create_augroup("PaneResize", { clear = true })

vim.api.nvim_create_autocmd('VimResized', {
  pattern = '*',
  group = group,
  callback = function()
    vim.cmd('wincmd =')
  end,
  desc = 'keep panes split at equal sizes',
})

