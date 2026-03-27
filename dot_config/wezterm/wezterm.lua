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

-- macOS/Linux copy-paste friendly bindings
config.keys = {
  { key = "c", mods = "CMD", action = wezterm.action.CopyTo("Clipboard") },
  { key = "v", mods = "CMD", action = wezterm.action.PasteFrom("Clipboard") },
  { key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
  { key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
  { key = "Enter", mods = "ALT", action = wezterm.action.ToggleFullScreen },
}

return config