require('nvim-treesitter.configs').setup {
  sync_install = true,
  highlight = {
    enable = true,
    disable = { 'html' },
  },
  indent = {
    enable = false,
  },
}
