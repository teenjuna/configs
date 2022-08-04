require('nvim-tree').setup {
  open_on_setup = true,
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  view = {
    centralize_selection = true,
  },
}
