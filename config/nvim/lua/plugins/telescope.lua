local actions = require('telescope.actions')
local themes = require('telescope.themes')

require('telescope').setup{
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

require('telescope').load_extension('fzf')

local M = {}

M.find_files = function()
  local opts = themes.get_dropdown {
    path_display = {
      "absolute",
    },
    previewer = false,
    hidden = true,
    layout_config = {
      width = .75,
    },
  }

  require('telescope.builtin').find_files(opts)
end

M.find_buffers = function()
  local opts = themes.get_dropdown {
    previewer = false,
    hidden = true,

    layout_config = {
      width = .75,
    }, 
  }

  require('telescope.builtin').buffers(opts)
end

M.find_dotfiles = function()
  local opts = themes.get_dropdown {
    previewer = false,
    hidden = true,
    cwd = '~/workspace/ryan/dotfiles',
    
    layout_config = {
      width = .75,
    }, 
  }

  require('telescope.builtin').find_files(opts)
end

M.live_grep = function()
  require('telescope.builtin').live_grep()
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