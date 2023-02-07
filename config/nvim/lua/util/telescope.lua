local themes = require('telescope.themes')

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
    cwd = '~/dev/dotfiles',

    layout_config = {
      width = .75,
    },
  }

  require('telescope.builtin').find_files(opts)
end

M.help_tags = function()
  local opts = themes.get_dropdown {
    previewer = false,
    hidden = true,

    layout_config = {
      width = .75,
    },
  }

  require('telescope.builtin').help_tags(opts)
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
