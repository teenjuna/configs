local on_attach = function(client, bufnr)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr })
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = bufnr })
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { buffer = bufnr })
  -- vim.keymap.set('n', '<leader>a', require('telescope').lsp_code_actions, { buffer = bufnr })

  -- Format on save
  vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
end

-- Setup rust_analyzer
require('rust-tools').setup {
  tools = {
    autoSetHints = true,
    inlay_hints = {
      only_current_line = false,
      show_parameter_hints = false,
      other_hints_prefix = '-> ',
    },
  },
  server = {
    on_attach = on_attach,
    settings = {
      ['rust-analyzer'] = {
        procMacro = {
          enable = true,
        },
        rustfmt = {
          extraArgs = { '+nightly' },
        },
        checkOnSave = {
          command = 'clippy',
        },
        cargo = {
          -- features = { 'serde', 'unprocessed' },
        },
      },
    },
  },
}

-- Setup sumneko_lua
-- vim.lsp.set_log_level 'debug'
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
require('lspconfig').sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Setup jdtls
-- NOTE: jdtls requires $WORKSPACE variable to be set.
-- To use it with different projects, use `direnv`.
-- More: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls
-- TODO: setup formatting on save (null-ls or jdtls config)
require('lspconfig').jdtls.setup {
  on_attach = on_attach,
  cmd = { 'jdtls' },
}

-- Setup Emmet
-- require('lspconfig').emmet_ls.setup {
--   on_attach = on_attach,
--   filetypes = { 'typescriptreact', 'html', 'css' },
-- }

-- require('lspconfig').html.setup {
--   on_attach = on_attach,
-- }

-- Setup tailwind (too slow)
-- require('lspconfig').tailwindcss.setup {
--   on_attach = on_attach,
-- }

-- Setup tsserver
require('lspconfig').tsserver.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
    -- There's also https://www.reddit.com/r/neovim/comments/u5si2w/comment/i55p6s1/?utm_source=share&utm_medium=web2x&context=3
  end,
}

-- Setup cssls
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Setup null-ls
require('null-ls').setup {
  on_attach = on_attach,
  sources = {
    -- TODO: setup sumneko_lua formatting.
    -- See: https://github.com/sumneko/lua-language-server/wiki/code-reformat

    -- $ cargo install stylua
    require('null-ls').builtins.formatting.stylua,

    -- pnpm install -g @fsouza/prettierd
    -- also, don't forget aout prettier-plugin-tailwindcss (https://tailwindcss.com/blog/automatic-class-sorting-with-prettier).
    -- and don't forget to specify the plugin in the local prettier config
    require('null-ls').builtins.formatting.prettierd.with {
      filetypes = { 'html', 'css', 'scss', 'json', 'yaml', 'markdown', 'typescriptreact', 'typescript' },
    },

    -- require('null-ls').builtins.diagnostics.eslint_d,
  },
}
