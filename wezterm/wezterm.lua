local wezterm = require 'wezterm'

local font = 'JetBrainsMono NF'

return {
  automatically_reload_config = false,
  check_for_updates = false,
  detect_password_input = false,
  allow_win32_input_mode = false,

  clean_exit_codes = { 130 },

  enable_tab_bar = false,
  use_fancy_tab_bar = true,
  window_decorations = 'TITLE|RESIZE',
  integrated_title_button_style = 'Gnome',
  window_padding = { left = 5, right = 5, top = 10, bottom = 2 },
  adjust_window_size_when_changing_font_size = false,

  window_frame = {
    inactive_titlebar_bg = '#303030',
    active_titlebar_bg = '#282828',
    inactive_titlebar_fg = '#cccccc',
    active_titlebar_fg = '#ffffff',
    inactive_titlebar_border_bottom = '#282828',
    active_titlebar_border_bottom = '#282828',
    button_fg = '#cccccc',
    button_bg = '#282828',
    button_hover_fg = '#ffffff',
    button_hover_bg = '#3b3052',
    font = wezterm.font 'Inter',
    font_size = 11,

    -- border_left_width = '2',
    -- border_right_width = '2',
    -- border_bottom_height = '2',
    -- border_top_height = '2',
    -- border_left_color = '#333333',
    -- border_right_color = '#333333',
    -- border_bottom_color = '#333333',
    -- border_top_color = '#333333',
  },
  integrated_title_buttons = { 'Close' },

  bold_brightens_ansi_colors = true,
  line_height = 1.0,
  cell_width = 1.0,
  animation_fps = 1,
  font = wezterm.font(font),
  font_rules = {
    {
      italic = true,
      intensity = 'Bold',
      font = wezterm.font { family = font, weight = 'Bold', style = 'Italic' }
    },
    {
      italic = true,
      intensity = 'Half',
      font = wezterm.font { family = font, weight = 'DemiBold', style = 'Italic' }
    },
    {
      italic = true,
      intensity = 'Normal',
      font = wezterm.font { family = font, style = 'Italic' }
    }
  },
  -- font_size = 12.0,

  default_cursor_style = 'BlinkingBar',
  cursor_thickness = .9, -- actually 1 px
  force_reverse_video_cursor = true,

  colors = {
    foreground = '#ebdbb2',
    background = '#282828',
    ansi = {
      '#3c3836',
      '#cc241d',
      '#98971a',
      '#d79921',
      '#458588',
      '#b16286',
      '#689d6a',
      '#a89984',
    },
    brights = {
      '#928374',
      '#fb4934',
      '#b8bb26',
      '#fabd2f',
      '#83a598',
      '#d3869b',
      '#8ec07c',
      '#ebdbb2',
    },
    selection_fg = '#282828',
    selection_bg = '#ebdbb2',
    cursor_border = '#fe8019'
  }
}
