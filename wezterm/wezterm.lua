local wezterm = require("wezterm")
return {
	font = wezterm.font("JetBrains Mono"),
	font_size = 13,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	window_background_opacity = 1.0,
	window_padding = {
		left = 2,
		right = 2,
		top = 2,
	},
	color_scheme = "Catppuccin",
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	inactive_pane_hsb = {
		brightness = 0.9,
	},
	-- colors = {
	-- 	background = "#080808",
	-- 	tab_bar = {
	-- 		background = "#080808",
	-- 		active_tab = {
	-- 			bg_color = "#006644",
	-- 			fg_color = "#ffffff",
	-- 		},
	-- 		inactive_tab = {
	-- 			bg_color = "#000000",
	-- 			fg_color = "#ffffff",
	-- 		},
	-- 		inactive_tab_hover = {
	-- 			bg_color = "#006644",
	-- 			fg_color = "#ffffff",
	-- 		},
	-- 		new_tab = {
	-- 			bg_color = "#000000",
	-- 			fg_color = "#ffffff",
	-- 		},
	-- 		new_tab_hover = {
	-- 			bg_color = "#006644",
	-- 			fg_color = "#ffffff",
	-- 		},
	-- 	},
	-- },
	-- Catppuccin theme
	colors = {
		indexed = { [16] = "#F8BD96", [17] = "#F5E0DC" },

		scrollbar_thumb = "#575268",
		split = "#161320",

		tab_bar = {
			background = "#1E1E2E",
			active_tab = {
				bg_color = "#575268",
				fg_color = "#D9E0EE",
			},
			inactive_tab = {
				bg_color = "#1E1E2E",
				fg_color = "#D9E0EE",
			},
			inactive_tab_hover = {
				bg_color = "#575268",
				fg_color = "#D9E0EE",
			},
			new_tab = {
				bg_color = "#1E1E2E",
				fg_color = "#D9E0EE",
			},
			new_tab_hover = {
				bg_color = "#575268",
				fg_color = "#D9E0EE",
				italic = true,
			},
		},

		visual_bell = "#302D41",

		-- nightbuild only
		compose_cursor = "#F8BD96",
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
