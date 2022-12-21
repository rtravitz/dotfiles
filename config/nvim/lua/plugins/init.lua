local is_bootstrap = require('plugins.plug')
if is_bootstrap then
  return is_bootstrap
end

require('plugins.telescope')
require('plugins.treesitter')
require('plugins.cmp')
require('plugins.nvim-tree')
require('plugins.mason')
require('plugins.lualine')

-- Turn on lsp status information
require('fidget').setup()

return is_bootstrap
