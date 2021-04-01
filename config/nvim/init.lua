require('plugins')
require('treesitter')
require('lsp')
require('settings')
require('maps')

--vim.cmd([[
--function! s:TmuxRepeat()
  --silent! exec "!tmux select-pane -l && tmux send up enter && tmux select-pane -l"
  --redraw!
--endfunction
--]])
