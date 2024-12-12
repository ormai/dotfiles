local wezterm = require 'wezterm'

return {
  automatically_reload_config = false,
  check_for_updates = false,
  detect_password_input = false,
  allow_win32_input_mode = false,

  clean_exit_codes = { 130 },

  adjust_window_size_when_changing_font_size = false,
  line_height = 1.0,
  cell_width = 1.0,
  animation_fps = 1,
  font = wezterm.font 'JetBrainsMono NF',
  -- font_size = 12.0,

  cursor_blink_rate = 0,
  cursor_thickness = 1,
  force_reverse_video_cursor = true,

  bold_brightens_ansi_colors = "BrightAndBold",
  colors = {
    foreground = "#fbf1c7",
    background = "#282828",
    ansi = {
      "#282828",
      "#cc241d",
      "#98971a",
      "#d79921",
      "#458588",
      "#b16286",
      "#689d6a",
      "#a89984",
    },
    brights = {
      "#928374",
      "#fb4934",
      "#b8bb26",
      "#fabd2f",
      "#83a598",
      "#d3869b",
      "#8ec07c",
      "#ebdbb2",
    },
    selection_fg = '#282828',
    selection_bg = '#fbf1c7',
  },

  enable_scroll_bar = false,
  enable_tab_bar = false,
  window_decorations = "TITLE|INTEGRATED_BUTTONS",
  integrated_title_button_style = "Gnome",
  window_padding = { left = 5, right = 5, top = 5, bottom = 5, },
}
