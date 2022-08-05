require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'lua', 'rust', 'typescript', 'sql', 'go', 'html', 'css', 'graphql', 'prisma',
		'python'
	},
	--sync_install = true,
	highlight = {
		enable = true,
		disable = { 'html' },
	},
	indent = {
		enable = false,
	},
}
