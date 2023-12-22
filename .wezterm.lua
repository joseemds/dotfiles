local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.enable_tab_bar = false
config.color_scheme = 'Everforest Dark (Gogh)'
config.font = wezterm.font "Lilex"
config.font_size = 14

return config
