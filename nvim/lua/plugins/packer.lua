-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Automatically run :PackerCompile whenever this file is updated
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy search
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }

  -- Easier motions
  use {
    'phaazon/hop.nvim',
    branch = 'master',
  }

  -- Themes
  use 'tjdevries/colorbuddy.nvim'
  use 'bluz71/vim-moonfly-colors'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'onsails/lspkind-nvim'

  -- Auto pairs
  use 'windwp/nvim-autopairs'

  -- Comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }

  -- Identation based on filetype
  -- use 'tpope/vim-sleuth'

  -- Scrollbar
  use 'petertriho/nvim-scrollbar'

  -- Markdown preview
  -- use {
  --   'iamcco/markdown-preview.nvim',
  --   run = 'cd app && pnpm install',
  -- }
  use 'ellisonleao/glow.nvim'
end)
