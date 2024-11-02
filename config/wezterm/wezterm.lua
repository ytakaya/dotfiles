local wezterm = require 'wezterm'

local config = {
    initial_cols = 180,
    initial_rows = 50,
    window_background_opacity = 0.85,
    font = wezterm.font('JetBrains Mono', { weight = 'Bold' }),
    font_size = 16.0,
    color_scheme = 'nord',
}

-- ショートカットキー設定
local act = wezterm.action
config.keys = {
  -- SHIFT|ALT+左矢印でカーソルを前の単語に移動
  {
    key = "LeftArrow",
    mods = "SHIFT|ALT",
    action = act.SendKey {
      key = "b",
      mods = "META",
    },
  },
  -- SHIFT|ALT+右矢印でカーソルを次の単語に移動
  {
    key = "RightArrow",
    mods = "SHIFT|ALT",
    action = act.SendKey {
      key = "f",
      mods = "META",
    },
  },
  -- SHIFT|ALT+Backspaceで前の単語を削除
  {
    key = "Backspace",
    mods = "SHIFT|ALT",
    action = act.SendKey {
      key = "w",
      mods = "CTRL",
    },
  },
  {
    key = "d",
    mods = "CTRL",
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    key = "v",
    mods = "CTRL",
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    key = "x",
    mods = "CTRL",
    action = wezterm.action.CloseCurrentPane { confirm = true }
  },
  {
    key = "LeftArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection 'Left'
  },
  {
    key = "RightArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection 'Right'
  },
  {
    key = "UpArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection 'Up'
  },
  {
    key = "DownArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection 'Down'
  }
}

return config