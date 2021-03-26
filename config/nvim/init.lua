require('plugins')
require('treesitter')
require('lsp')
require('plugins.compe')
require('plugins.telescope')
require('settings')
require('maps')

vim.cmd('colorscheme OceanicNext')
vim.cmd('filetype plugin indent on')

-- keep panes split at equal sizes
vim.api.nvim_command('augroup pane_splits')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd VimResized * wincmd =')
vim.api.nvim_command('augroup END')


-- Still needs to be ported
--vim.cmd([[
--function! s:TmuxRepeat()
  --silent! exec "!tmux select-pane -l && tmux send up enter && tmux select-pane -l"
  --redraw!
--endfunction
--]])
