local ls = require 'luasnip'

ls.config.set_config {
  history = true,
  updateevents = 'CursorHold,CursorHoldI',
}

ls.snippets = {
  lua = {
    ls.parser.parse_snippet('req', "require('$1')"),
  },
}
