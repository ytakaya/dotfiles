local wezterm = require 'wezterm'
return {
    initial_cols = 180,
    initial_rows = 50,
    window_gackground_opacity = 0.75,
    font = wezterm.font('JetBrains Mono', { weight = 'Bold' }),
    font_size = 16.0,
    color_scheme = 'nord',
}
