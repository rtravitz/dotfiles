return {
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      renderer = {
        add_trailing = true,
        icons = {
          show = {
            file = false,
            folder = false,
            folder_arrow = false,
            git = false,
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      git = {
        ignore = false,
      },
    }
  }
}
