-- ":luafile path/to/dev.lua" to source this file and enable hot reloading of the module
--
-- force lua to import the modules again
package.loaded['dev'] = nil
package.loaded['perforce'] = nil

vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>luafile lua/dev.lua<cr>', { noremap = true })

Perforce = require('perforce')
vim.api.nvim_set_keymap('n', '<leader>w', '<cmd>lua Perforce.checkout()<cr>', { noremap = true })
