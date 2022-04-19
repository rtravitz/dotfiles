local ts = require 'nvim-treesitter.configs'
ts.setup {
  ensure_installed = 'all',
  -- https://github.com/claytonrcarter/tree-sitter-phpdoc/issues/15
  ignore_install = { 'phpdoc' },
  highlight = { enable = true },
  indent = { enable = false },
}
