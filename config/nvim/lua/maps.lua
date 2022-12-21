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
map('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
map('n', '<leader>ff', require('plugins.telescope').find_files, { desc = '[F]ind [F]iles'})
map('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind [G]rep'})
map('n', '<leader>fb', require('plugins.telescope').buffers, { desc = '[F]ind [B]uffers'})
map('n', '<leader>fc', require('plugins.telescope').find_dotfiles, { desc = '[F]ind [C]onfig'})
map('n', '<leader>fh', require('plugins.telescope').help_tags, { desc = '[F]ind [H]elp' })
map('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
map('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

map('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
map('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })

-- nerdtree
map('n', '\\', ':NvimTreeToggle<cr>')
map('n', '<leader>nf', ':NvimTreeFindFile<cr>')

-- various file formatters
map('n', '<leader>j', ':%!jq \'\'<cr>')
map('n', '<leader>h', ':%!xmllint --format --encode UTF-8 --html -<cr>')
map('n', '<leader>x', ':%!xmllint --format -<cr>')

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
