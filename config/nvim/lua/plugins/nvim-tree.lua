require('nvim-tree').setup({
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
})
