local actions = require('telescope.actions')
local themes = require('telescope.themes')

require('telescope').setup{
  defaults = {
    prompt_prefix = '❯ ',
    selection_caret = '❯ ',
    winblend = 0,
    preview_cutoff = 120,
    layout_strategy = 'horizontal',
    layout_defaults = {
      horizontal = {
        width_padding = 0.1,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      }
    },
    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    prompt_position = "top",
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
    entry_prefix = "  ",
    initial_mode = "insert",
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    width = 0.75,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
  }
}

local M = {}

M.find_files = function()
  local opts = themes.get_dropdown {
    width = .75,
    previewer = false,
    shorten_path = false,
  }

  require('telescope.builtin').find_files(opts)
end

M.find_buffers = function()
  local opts = themes.get_dropdown {
    width = .75,
    previewer = false,
    shorten_path = false,
  }

  require('telescope.builtin').buffers(opts)
end

M.find_dotfiles = function()
  local opts = themes.get_dropdown {
    width = .75,
    previewer = false,
    shorten_path = false,
    cwd = '~/workspace/ryan/dotfiles',
  }

  require('telescope.builtin').find_files(opts)
end

M.live_grep = function()
  local opts = {
    shorten_path = true,
  }

  require('telescope.builtin').live_grep(opts)
end

return setmetatable({}, {
  __index = function(_, k)
    if M[k] then
      return M[k]
    else
      return require('telescope.builtin')[k]
    end
  end
})
