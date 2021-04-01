vim.g.mapleader = ','

local map = vim.api.nvim_set_keymap

-- copy buffer path to system clipboard
map('n', '<leader>cp', ':let @* = expand("%")<cr>', { noremap = true })
map('n', '<leader>q', ':bd', { noremap = true })

-- to vertical: takes horizontal splits and makes them vertical
map('n', '<leader>tv', ':windo wincmd H<cr>', { noremap = true })

-- to horizontal: takes vertical splits and makes them horizontal
map('n', '<leader>th', ':windo wincmd K<cr>', { noremap = true })

-- fuzzy finding with fzf
map('n', '<leader>f', "<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = true })
map('n', '<leader>g', "<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap = true })
map('n', '<leader>b', "<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap = true })

-- nerdtree
map('n', "\\", ':NERDTreeToggle<cr>', { noremap = true })
map('n', '<leader>nf', ':NERDTreeFind<cr>', { noremap = true })

-- editing and sourcing vimrc, which does not work very well nowadays
map('n', '<leader>ev', ':vsplit $MYVIMRC<cr>', { noremap = true })
map('n', '<leader>sv', ':source $MYVIMRC<cr>', { noremap = true })

-- various file formatters
map('n', '<leader>j', ':%!jq \'\'<cr>', { noremap = true })
map('n', '<leader>h', ':%!xmllint --format --encode UTF-8 --html -<cr>', { noremap = true })
map('n', '<leader>x', ':%!xmllint --format -<cr>', { noremap = true })
map('n', '<leader>y', ':%!yq r -<cr>', { noremap = true })

-- convert markdown buffer to jira's abomination markup syntax
map('n', '<leader>tj', ':%!pandoc -f markdown -t jira -<cr>', { noremap = true })

-- navigate quickfix
map('n', '<c-n>', ':cnext<cr>', { noremap = true })
map('n', '<c-p>', ':cprevious<cr>', { noremap = true })
map('n', '<leader>ef', ':cclose<cr>', { noremap = true })

-- vimsplit navigation
map('n', '<c-j>', '<c-w><c-j>', { noremap = true })
map('n', '<c-k>', '<c-w><c-k>', { noremap = true })
map('n', '<c-l>', '<c-w><c-l>', { noremap = true })
map('n', '<c-h>', '<c-w><c-h>', { noremap = true })

-- buffer prev/next as encoded alt+z or alt+x on macOS
map('n', 'Ω', ':bprev<cr>', { noremap = true })
map('n', '≈', ':bnext<cr>', { noremap = true })

-- resize split horizontally encoded as alt+= and alt+- on macOS
map('n', '≠', ':vertical resize +10<cr>', { noremap = true })
map('n', '–', ':vertical resize -10<cr>', { noremap = true })

