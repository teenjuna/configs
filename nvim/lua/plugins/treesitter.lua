require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  sync_install = false,
  highlight = {
    enable = true,
    disable = { 'html' },
  },
  indent = {
    enable = false,
  },
}
