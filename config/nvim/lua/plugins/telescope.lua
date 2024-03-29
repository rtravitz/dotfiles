return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function(_, opts)
      require('telescope').setup(opts)
      pcall(require('telescope').load_extension, 'fzf')
    end,
    opts = function()
      local actions = require('telescope.actions')

      return {
        defaults = {
          path_display = {
            "shorten",
          },
          prompt_prefix = '❯ ',
          selection_caret = '❯ ',
          winblend = 0,
          layout_strategy = 'horizontal',
          layout_config = {
            preview_cutoff = 120,
            prompt_position = "top",
            horizontal = {
              mirror = false,
            },
            vertical = {
              mirror = false,
            },
          },
          selection_strategy = "reset",
          sorting_strategy = "descending",
          scroll_strategy = "cycle",
          mappings = {
            i = {
              ["<esc>"] = actions.close
            },
          },
          entry_prefix = "  ",
          initial_mode = "insert",
          file_sorter =  require'telescope.sorters'.get_fuzzy_file,
          file_ignore_patterns = {'.git/*', 'node_modules/*'},
          generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
          border = {},
          borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
          use_less = true,
          set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
          grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
          qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
        }
      }
    end
  }
}
