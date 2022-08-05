require('lualine').setup({
	options = {
		globalstatus = true,
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		refresh = {
			statusline = 50,
			tabline = 50,
			winbar = 50,
		},
		disabled_filetypes = {
			winbar = { 'NvimTree' },
		},
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff' },
		lualine_c = {},
		lualine_x = { 'diagnostics' },
		lualine_y = { 'encoding', 'filetype', 'progress' },
		lualine_z = { 'location' }
	},
	winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { '%=', 'filename', '%=' },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	inactive_winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { '%=', 'filename', '%=' },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
})
