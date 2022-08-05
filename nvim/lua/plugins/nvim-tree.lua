require('nvim-tree').setup {
	hijack_cursor = true,
	update_focused_file = {
		enable = true,
	},
	diagnostics = {
		enable = true,
	},
}

local api = require('nvim-tree.api')
local Event = api.events.Event
api.events.subscribe(Event.TreeOpen, function()
	vim.wo.cursorline = true
end)
