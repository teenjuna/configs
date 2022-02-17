local on_attach = function(client, bufnr)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr })
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = bufnr })
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { buffer = bufnr })

  -- Format on save
  vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
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
        rustfmt = {
          extraArgs = { '+nightly' },
        },
        checkOnSave = {
          command = 'clippy',
        },
      },
    },
  },
}

-- Setup sumneko_lua
vim.lsp.set_log_level 'debug'
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
require('lspconfig').emmet_ls.setup {
  on_attach = on_attach,
  filetypes = { 'html', 'css', 'tsx', 'jsx' },
}

-- Setup tailwind
require('lspconfig').tailwindcss.setup {}

-- Setup tsserver
require('lspconfig').tsserver.setup {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    on_attach(client, bufnr)
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
    require('null-ls').builtins.formatting.stylua,
    require('null-ls').builtins.formatting.prettierd.with {
      filetypes = { 'html', 'css', 'scss', 'json', 'yaml', 'markdown' },
    },
    require('null-ls').builtins.diagnostics.eslint_d,
    -- require('null-ls').builtins.completion.spell, -- this only brings garbage
  },
}
