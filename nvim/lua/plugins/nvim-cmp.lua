local cmp = require 'cmp'
local lspkind = require 'lspkind'

vim.cmd [[
  let g:copilot_no_tab_map = v:true
  imap <expr> <Plug>(vimrc:copilot-dummy-map) copilot#Accept("\<Tab>")
]]

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert {
    -- ['<c-l>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<c-y>'] = cmp.mapping(
      cmp.mapping.confirm {
        select = true,
        bahvior = cmp.ConfirmBehavior.Insert,
      },
      { 'i', 's', 'c' }
    ),
    ['<c-n>'] = cmp.mapping.select_next_item(),
    ['<c-p>'] = cmp.mapping.select_prev_item(),
    ['<c-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<c-u>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<c-e>'] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ['<C-g>'] = cmp.mapping(function(fallback)
      vim.api.nvim_feedkeys(
        vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)),
        'n',
        true
      )
    end),
  },

  sources = cmp.config.sources({
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
  }, {
    { name = 'calc' },
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
        calc = '[calc]',
      },
    },
  },

  view = {
    entries = 'native',
  },

  experimental = {
    ghost_text = false, -- conflicts with copilot.vim
  },
}

cmp.setup.cmdline {
  mapping = cmp.mapping.preset.cmdline {},
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
