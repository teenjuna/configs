local cmp = require 'cmp'
local lspkind = require 'lspkind'

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<c-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<c-u>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<c-y>'] = cmp.mapping.confirm {
      bahvior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ['<c-e>'] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ['<c-space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'path' },
  }, {
    { name = 'buffer', keyword_length = 5 },
  }),

  formatting = {
    format = lspkind.cmp_format {
      mode = 'text',
      maxwidth = 50,
      menu = {
        nvim_lsp = '[lsp]',
        nvim_lua = '[api]',
        luasnip = '[snip]',
        buffer = '[buf]',
        path = '[path]',
      },
    },
  },

  experimental = {
    native_menu = false,
    ghost_text = true,
  },
}

-- nvim-cmp highlight groups
-- local Group = require("colorbuddy.group").Group
-- local g = require("colorbuddy.group").groups
-- local s = require("colorbuddy.style").styles
--
-- Group.new("CmpItemAbbr", g.Comment)
-- Group.new("CmpItemAbbrDeprecated", g.Error)
-- Group.new("CmpItemAbbrMatchFuzzy", g.CmpItemAbbr.fg:dark(), nil, s.italic)
-- Group.new("CmpItemKind", g.Special)
-- Group.new("CmpItemMenu", g.NonText)

-- Setup auto-pairs
require('nvim-autopairs').setup {}
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
