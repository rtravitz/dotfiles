vim.api.nvim_create_autocmd('VimResized', {
  pattern = '*',
  group = vim.api.nvim_create_augroup('PaneResize', { clear = true }),
  callback = function()
    vim.cmd('wincmd =')
  end,
  desc = 'keep panes split at equal sizes',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  group = vim.api.nvim_create_augroup('Markdown', { clear = true }),
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.keymap.set('n', 'j', 'gj', { noremap = true, buffer = true })
    vim.keymap.set('n', 'k', 'gk', { noremap = true, buffer = true })
  end,
  desc = 'add maps and settings for markdown files'
})
