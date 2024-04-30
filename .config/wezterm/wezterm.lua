local wezterm = require("wezterm")
local config = {
	default_prog = { "/bin/zsh", "-l" },
	allow_square_glyphs_to_overflow_width = "Never",
	hide_mouse_cursor_when_typing = true,
	quit_when_all_windows_are_closed = true,
	color_scheme = "Tokyo Night Storm",
	font_size = 18,
	line_height = 1.0,
	font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Regular" }),
	font_rules = {
		{
			italic = true,
			font = wezterm.font("Maple Mono NF CN", { weight = "Bold", italic = true }),
		},
	},
	adjust_window_size_when_changing_font_size = true,
	native_macos_fullscreen_mode = true,
	warn_about_missing_glyphs = false,
	keys = {
		{ key = "F4",        action = "ToggleFullScreen" },
		{ key = "F5",        action = "ReloadConfiguration" },
		{ key = "+",         mods = "CTRL",                 action = "IncreaseFontSize" },
		{ key = "-",         mods = "CTRL",                 action = "DecreaseFontSize" },
		{ key = "Backspace", mods = "CTRL",                 action = "ResetFontSize" },
	},
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,

	enable_tab_bar = false,
	enable_scroll_bar = false,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	show_new_tab_button_in_tab_bar = false,

	window_background_opacity = 0.7,
	macos_window_background_blur = 70,
	window_close_confirmation = "NeverPrompt",
	text_background_opacity = 0.9,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	term = "xterm-256color",
}

return config
