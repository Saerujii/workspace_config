local wezterm = require 'wezterm'
local config = wezterm.config_builder()


config.color_scheme = 'Argonaut'

config.colors = {
    cursor_bg = "white",
    cursor_fg = "black",
    cursor_border = 'white',
}

config.font = wezterm.font "JetBrains Mono"

config.font_size = 11

config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = 0.8

config.window_padding = {
    left = "4px",
    right = "4px",
    top = "8px",
    bottom = "8px"
}


return config
