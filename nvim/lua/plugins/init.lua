-- Automatically run :PackerCompile whenever this file is updated
-- TODO: move to lua (check out TJ video to learn)
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Navigation
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = {
			{ 'nvim-lua/plenary.nvim' }
		},
		config = function()
			require('plugins/telescope')
		end
	}
	use {
		'kyazdani42/nvim-tree.lua',
		tag = 'nightly', -- optional, updated every week. (see issue #1193)
		requires = {
			'kyazdani42/nvim-web-devicons',
		},
		config = function()
			require('plugins/nvim-tree')
		end,
	}

	-- Language servers, linters, debuggers
	use {
		'williamboman/mason.nvim',
		requires = {
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'neovim/nvim-lspconfig' },
			{ 'simrat39/rust-tools.nvim' },
		},
		config = function()
			require('mason').setup()
			require('mason-lspconfig').setup()
			require('rust-tools').setup()
		end,
	}
	use {
		'j-hui/fidget.nvim',
		config = function()
			require('fidget').setup()
		end
	}

	-- Autocomplete
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-cmdline' },
			{ 'L3MON4D3/LuaSnip' },
			{ 'saadparwaiz1/cmp_luasnip' },
		},
		config = function()
			require('plugins/nvim-cmp')
		end,
	}
	use {
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup()
		end
	}
	use 'github/copilot.vim'

	-- Syntax
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		config = function()
			require('plugins/treesitter')
		end
	}
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	-- Movement
	use {
		'phaazon/hop.nvim',
		branch = 'v2',
		config = function()
			require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
		end
	}

	-- Better UI
	use {
		'stevearc/dressing.nvim',
		config = function()
			require('plugins/dressing')
		end
	}
	use {
		'folke/todo-comments.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim' }
		},
		config = function()
			require('todo-comments').setup()
		end
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('plugins/lualine')
		end
	}

	-- Colorschemes
	use 'bluz71/vim-moonfly-colors'
	use 'NLKNguyen/papercolor-theme'
	use {
		'catppuccin/nvim',
		as = 'catppuccin',
	}
	use {
		'daschw/leaf.nvim',
		config = function()
			require('plugins/leaf')
		end
	}
end)
