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

  -- Directory tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
  }

  -- Themes
  use 'tjdevries/colorbuddy.nvim'
  use 'bluz71/vim-moonfly-colors'
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
  }
  use 'savq/melange'
  use 'rebelot/kanagawa.nvim'
  use 'folke/tokyonight.nvim'
  use 'NLKNguyen/papercolor-theme'

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
  use 'hrsh7th/cmp-calc'
  use 'onsails/lspkind-nvim'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'github/copilot.vim'

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
