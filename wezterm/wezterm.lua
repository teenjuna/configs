local wezterm = require("wezterm")
local catppuccin = require("colors/catppuccin")

return {
	colors = catppuccin,
	font = wezterm.font("JetBrains Mono"),
	font_size = 13,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	window_background_opacity = 1.0,
	window_padding = {
		left = 2,
		right = 2,
		top = 2,
	},
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	inactive_pane_hsb = {
		brightness = 0.8,
	},
	keys = {
		{
			mods = "CMD",
			key = "w",
			action = wezterm.action({ CloseCurrentPane = { confirm = true } }),
		},
		{
			mods = "CTRL|CMD",
			key = "f",
			action = "ToggleFullScreen",
		},
		{
			mods = "CMD|OPT",
			key = "h",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{
			mods = "CMD|OPT",
			key = "v",
			action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
		},
		{
			mods = "CMD",
			key = "h",
			action = wezterm.action({ ActivatePaneDirection = "Left" }),
		},
		{
			mods = "CMD",
			key = "j",
			action = wezterm.action({ ActivatePaneDirection = "Down" }),
		},
		{
			mods = "CMD",
			key = "k",
			action = wezterm.action({ ActivatePaneDirection = "Up" }),
		},
		{
			mods = "CMD",
			key = "l",
			action = wezterm.action({ ActivatePaneDirection = "Right" }),
		},
		{
			mods = "CMD|CTRL",
			key = "h",
			action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
		},
		{
			mods = "CMD|CTRL",
			key = "j",
			action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
		},
		{
			mods = "CMD|CTRL",
			key = "k",
			action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
		},
		{
			mods = "CMD|CTRL",
			key = "l",
			action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
		},
	},
	native_macos_fullscreen_mode = true,
}
