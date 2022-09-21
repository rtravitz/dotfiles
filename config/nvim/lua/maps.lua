vim.g.mapleader = ','
vim.g.maplocalleader = ','

local map = vim.keymap.set

function TmuxRepeat()
  vim.api.nvim_command('silent! exec "!tmux select-pane -l && tmux send up enter && tmux select-pane -l"')
  vim.api.nvim_command('redraw!')
end

-- bye bye highlights
map('n', '<space><space>', ':noh<cr>')

-- I can't relearn this: https://github.com/neovim/neovim/pull/13268
map('n', 'Y', 'yy')

-- copy buffer path to system clipboard
map('n', '<leader>cp', ':let @* = expand("%")<cr>')
map('n', '<leader>q', ':bd<cr>')

-- to vertical: takes horizontal splits and makes them vertical
map('n', '<leader>tv', ':windo wincmd H<cr>')

-- to horizontal: takes vertical splits and makes them horizontal
map('n', '<leader>th', ':windo wincmd K<cr>')

-- fuzzy finding with fzf
map('n', '<leader>ff', require('plugins.telescope').find_files)
map('n', '<leader>fg', require('plugins.telescope').live_grep)
map('n', '<leader>fb', require('plugins.telescope').find_buffers)
map('n', '<leader>fd', require('plugins.telescope').find_dotfiles)
map('n', '<leader>fs', require('plugins.telescope').lsp_document_symbols)

-- nerdtree
map('n', '\\', ':NERDTreeToggle<cr>')
map('n', '<leader>nf', ':NERDTreeFind<cr>')

-- editing and sourcing vimrc, which does not work very well nowadays
map('n', '<leader>ev', ':vsplit $MYVIMRC<cr>')
map('n', '<leader>sv', ':source $MYVIMRC<cr>')

-- various file formatters
map('n', '<leader>j', ':%!jq \'\'<cr>')
map('n', '<leader>h', ':%!xmllint --format --encode UTF-8 --html -<cr>')
map('n', '<leader>x', ':%!xmllint --format -<cr>')
map('n', '<leader>y', ':%!yq r -<cr>')

-- convert markdown buffer to jira's abomination markup syntax
map('n', '<leader>tj', ':%!pandoc -f markdown -t jira -<cr>')

-- navigate quickfix
map('n', '<c-n>', ':cnext<cr>')
map('n', '<c-p>', ':cprevious<cr>')
map('n', '<leader>ef', ':cclose<cr>')

-- vimsplit navigation
map('n', '<c-j>', '<c-w><c-j>')
map('n', '<c-k>', '<c-w><c-k>')
map('n', '<c-l>', '<c-w><c-l>')
map('n', '<c-h>', '<c-w><c-h>')

-- buffer prev/next as encoded alt+z or alt+x on macOS
map('n', 'Ω', ':bprev<cr>')
map('n', '≈', ':bnext<cr>')

-- resize split horizontally encoded as alt+= and alt+- on macOS
map('n', '≠', ':vertical resize +10<cr>')
map('n', '–', ':vertical resize -10<cr>')

map('n', '<leader>r', TmuxRepeat)

map('n', '<leader>pe', require('perforce').checkout)
