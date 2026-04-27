local wezterm = require "wezterm"
local config = wezterm.config_builder()

-- Launch your shell
config.default_prog = { "zsh", "-l" }

-- Font
config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
  "Symbols Nerd Font Mono",
})
config.font_size = 14.0
config.line_height = 1.2

-- Appearance
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.85
config.text_background_opacity = 1.0
config.macos_window_background_blur = 20

config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.adjust_window_size_when_changing_font_size = false

-- Cursor
config.default_cursor_style = "BlinkingUnderline"
config.cursor_blink_rate = 600

-- Performance / rendering
config.max_fps = 120
config.front_end = "WebGpu"

-- Scrollback
config.scrollback_lines = 10000

-- macOS/Linux copy-paste friendly bindings + panel and tab management with ALT/Option key
config.keys = {
  { key = "c", mods = "CMD", action = wezterm.action.CopyTo("Clipboard") },
  { key = "v", mods = "CMD", action = wezterm.action.PasteFrom("Clipboard") },
  { key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
  { key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
  { key = "Enter", mods = "ALT", action = wezterm.action.ToggleFullScreen },
  { key = "t", mods = "ALT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
  { key = "w", mods = "ALT", action = wezterm.action.CloseCurrentTab { confirm = true } },
  -- Split pane with ALT + Shift + Enter and close with ALT + Shift + W
  { key = "Enter", mods = "ALT|SHIFT", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "Enter", mods = "ALT|SHIFT|CTRL", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "w", mods = "ALT|SHIFT", action = wezterm.action.CloseCurrentPane { confirm = true } },
  -- Pane management with ALT + Arrow keys, and resizing with ALT + SHIFT + Arrow keys
  { key = "LeftArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
  { key = "UpArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
  { key = "DownArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
  { key = "LeftArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize { "Left", 5 } },
  { key = "RightArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize { "Right", 5 } },
  { key = "UpArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize { "Up", 5 } },
  { key = "DownArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize { "Down", 5 } },
  -- Tab management with ALT + Tab and ALT + SHIFT + Tab
  { key = "Tab", mods = "ALT", action = wezterm.action.ActivateTabRelative(1) },
  { key = "Tab", mods = "ALT|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
}

return config