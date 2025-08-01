-- See this blog post for reference
-- https://mwop.net/blog/2024-07-04-how-i-use-wezterm.html

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is a third party plugin see. Blog post above about it and
-- where to install it
-- local session_manager = require("wezterm-session-manager/session-manager")

-- This is where you actually apply your config choices

config.scrollback_lines = 5000

-- Visuals
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 19
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 0,
}
config.window_decorations = "RESIZE"
-- TokyoNight Moon
-- https://github.com/folke/tokyonight.nvim/blob/main/extras/wezterm/tokyonight_moon.toml
config.colors = {
	foreground = "#c8d3f5",
	background = "#222436",
	cursor_bg = "#c8d3f5",
	cursor_border = "#c8d3f5",
	cursor_fg = "#222436",
	selection_bg = "#2d3f76",
	selection_fg = "#c8d3f5",
	split = "#82aaff",
	compose_cursor = "#ff966c",
	scrollbar_thumb = "#2f334d",
	ansi = { "#1b1d2b", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#828bb8" },
	brights = { "#444a73", "#ff8d94", "#c7fb6d", "#ffd8ab", "#9ab8ff", "#caabff", "#b2ebff", "#c8d3f5" },
}

-- Nightfly Theme
-- https://github.com/bluz71/vim-nightfly-colors/blob/master/extras/nightfly-wezterm.toml
-- config.colors = {
-- foreground = "#CBE0F0",
-- background = "#1E222A",
-- cursor_bg = "#47FF9C",
-- cursor_border = "#47FF9C",
-- cursor_fg = "#011423",
-- selection_bg = "#033259",
-- selection_fg = "#CBE0F0",
-- ansi = { "#1d3b53", "#fc514e", "#a1cd5e", "#e3d18a", "#82aaff", "#c792ea", "#7fdbca", "#a1aab8" },
-- brights = { "#7c8f8f", "#ff5874", "#21c7a8", "#ecc48d", "#82aaff", "#ae81ff", "#7fdbca", "#d6deeb" },
-- compose_cursor = "#e3d18a",
-- visual_bell = "#e3d18a",
-- }

config.window_background_opacity = 1.0
-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 10

-- NOT USING NOW
-- Workspaces with mux are confusing and the resurrect function has
-- to be run for each workspace so it defeats the purpose of using it.
-- Start up mux domain
-- config.unix_domains = {
-- 	{
-- 		name = "unix",
-- 	},
-- }

-- Useing the session manager
-- wezterm.on("save_session", function(window)
-- 	session_manager.save_state(window)
-- end)
-- wezterm.on("load_session", function(window)
-- 	session_manager.load_state(window)
-- end)
-- wezterm.on("restore_session", function(window)
-- 	session_manager.restore_state(window)
-- end)

-- Tabs
config.enable_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = true
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
config.tab_max_width = 32

-- Hot Keys
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1500 }
config.keys = {
	-- Tabs
	{
		mods = "LEADER",
		key = "t",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.ShowTabNavigator,
	},
	{
		key = ",",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},

	-- Splitting
	{
		mods = "LEADER",
		key = "|",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "m",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},

	-- Activate resize-pane mode until we cancel.
	{
		key = "Space",
		mods = "LEADER",
		action = wezterm.action.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},

	-- Misc.
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},

	-- Attach to muxer
	-- {
	-- 	key = "a",
	-- 	mods = "LEADER",
	-- 	action = wezterm.action.AttachDomain("unix"),
	-- },

	-- Detach from muxer
	-- {
	-- 	key = "d",
	-- 	mods = "LEADER",
	-- 	action = wezterm.action.DetachDomain({ DomainName = "unix" }),
	-- },

	-- Rename current workspace
	-- {
	-- 	key = ",",
	-- 	mods = "LEADER",
	-- 	action = wezterm.action.PromptInputLine({
	-- 		description = "Enter new name for workspace",
	-- 		action = wezterm.action_callback(function(window, pane, line)
	-- 			if line then
	-- 				wezterm.mux.rename_workspace(window:mux_window():get_workspace(), line)
	-- 			end
	-- 		end),
	-- 	}),
	-- },

	-- Show list of workspaces
	-- {
	-- 	key = "w",
	-- 	mods = "LEADER",
	-- 	action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }),
	-- },

	-- Session manager bindings
	-- {
	-- 	key = "S",
	-- 	mods = "LEADER|SHIFT",
	-- 	action = wezterm.action({ EmitEvent = "save_session" }),
	-- },
	-- {
	-- 	key = "R",
	-- 	mods = "LEADER|SHIFT",
	-- 	action = wezterm.action({ EmitEvent = "restore_session" }),
	-- },
}

config.key_tables = {
	-- Defines the keys that are active in our resize-pane mode.
	-- Since we're likely to want to make multiple adjustments,
	-- we made the activation one_shot=false. We therefore need
	-- to define a key assignment for getting out of this mode.
	-- 'resize_pane' here corresponds to the name="resize_pane" in
	-- the key assignments above.
	resize_pane = {
		{ key = "h", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },

		{ key = "l", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },

		{ key = "k", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },

		{ key = "j", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},
}

-- and finally, return the configuration to wezterm
return config
