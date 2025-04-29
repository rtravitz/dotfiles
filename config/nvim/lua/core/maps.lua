local map = vim.keymap.set

function TmuxRepeat()
  vim.api.nvim_command('silent! exec "!tmux select-pane -l && tmux send up enter && tmux select-pane -l"')
  vim.api.nvim_command('redraw!')
end

-- bye bye highlights
map('n', '<space><space>', '<cmd>noh<cr>')

-- I can't relearn this: https://github.com/neovim/neovim/pull/13268
map('n', 'Y', 'yy')

-- copy buffer path to system clipboard
map('n', '<leader>cp', '<cmd>let @* = expand("%")<cr>')
map('n', '<leader>q', '<cmd>bd<cr>')

-- to vertical: takes horizontal splits and makes them vertical
map('n', '<leader>tv', '<cmd>windo wincmd H<cr>')

-- to horizontal: takes vertical splits and makes them horizontal
map('n', '<leader>th', '<cmd>windo wincmd K<cr>')

-- fuzzy finding with telescope
map('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
map('n', '<leader>ff', require('util.telescope').find_files, { desc = '[F]ind [F]iles'})
map('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind [G]rep'})
map('n', '<leader>fb', require('util.telescope').buffers, { desc = '[F]ind [B]uffers'})
map('n', '<leader>fc', require('util.telescope').find_dotfiles, { desc = '[F]ind [C]onfig'})
map('n', '<leader>fh', require('util.telescope').help_tags, { desc = '[F]ind [H]elp' })
map('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
map('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

map('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
map('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })

-- nvim tree
map('n', '\\', '<cmd>Oil<cr>')
map('n', '<leader>nf', '<cmd>NvimTreeFindFile<cr>')

-- various file formatters
map('n', '<leader>j', '<cmd>%!jq \'\'<cr>')
map('n', '<leader>h', '<cmd>%!xmllint --format --encode UTF-8 --html -<cr>')
-- map('n', '<leader>x', '<cmd>%!xmllint --format -<cr>')

-- convert markdown buffer to jira's abomination markup syntax
map('n', '<leader>tj', '<cmd>%!pandoc -f markdown -t jira -<cr>')

-- navigate quickfix
map('n', '<c-n>', '<cmd>cnext<cr>')
map('n', '<c-p>', '<cmd>cprevious<cr>')
map('n', '<leader>ef', '<cmd>cclose<cr>')

-- buffer prev/next as encoded alt+z or alt+x on macOS
map('n', 'Ω', '<cmd>bprev<cr>')
map('n', '≈', '<cmd>bnext<cr>')

-- resize split horizontally encoded as alt+= and alt+- on macOS
map('n', '≠', '<cmd>vertical resize +10<cr>')
map('n', '–', '<cmd>vertical resize -10<cr>')

map('n', '<leader>r', TmuxRepeat)

map('n', '<leader>pe', require('lab.perforce').checkout)

map('n', '<leader>x', '<cmd>lua dofile(vim.fn.expand("%"))<cr>')
