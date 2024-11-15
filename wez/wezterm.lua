local wezterm = require("wezterm")
local act = wezterm.action

local launch_menu = {}
local font_family = "SauceCodePro NF"

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    table.insert(launch_menu, {
        label = "PowerShell",
        args = { "pwsh.exe" },
    })
end

return {
    check_for_updates = true,
    check_for_updates_interval_seconds = 86400,

    automatically_reload_config = true,
    initial_rows = 32,
    initial_cols = 130,

    default_prog = { "wsl", "~" },
    launch_menu = launch_menu,
    use_ime = true,
    window_decorations = "RESIZE",
    win32_system_backdrop = "Acrylic",
    use_fancy_tab_bar = true,
    window_frame = {
      inactive_titlebar_bg = "none",
      active_titlebar_bg = "none",
    },
    window_background_gradient = {
      colors = { "#2E3440" }
    },
    colors = {
      tab_bar = {
        inactive_tab_edge = "none",
      }
    },
    show_close_tab_button_in_tabs = true,
    wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
      local background = "#2E3440"
      local foreground = "#FFFFFF"
      local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
      local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_lower_left_triangle
      local edge_background = "none"

      if tab.is_active then
        background = "#5E81AC"
        foreground = "#FFFFFF"
      end
      local edge_foreground = background

      local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

      return {
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = SOLID_LEFT_ARROW },
        { Background = { Color = background } },
        { Foreground = { Color = foreground } },
        { Text = title },
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = SOLID_RIGHT_ARROW },
      }
    end),
    tab_bar_at_bottom = true,

    window_padding = {
      left = "1%",
      right = "1%",
      top = "1%",
      bottom = "0%",
    },

    front_end = "WebGpu",
    ime_preedit_rendering = "System",
    font = wezterm.font({ family = font_family }),
    font_rules = {
        {
            intensity = "Bold",
            font = wezterm.font({ family = font_family, weight = "Bold" }),
        },
        {
            italic = true,
            font = wezterm.font({ family = font_family, style = "Italic" }),
        },
        {
            italic = true,
            intensity = "Bold",
            font = wezterm.font({ family = font_family, weight = "Bold", style = "Italic" }),
        },
    },
    font_size = 12,
    freetype_load_target = "Normal",
    freetype_load_flags = "DEFAULT",
    window_background_opacity = 0.8,
    adjust_window_size_when_changing_font_size = false,
    color_scheme = "nord",
    audible_bell = "Disabled",

    keys = {
        {
            key = "v",
            mods = "SHIFT|CTRL",
            action = act.PasteFrom 'Clipboard',
        },
        {
            key = "x",
            mods = "ALT|SHIFT",
            action = wezterm.action({ CloseCurrentPane = { confirm = true } }),
        },
        {
            key = "z",
            mods = "ALT|SHIFT",
            action = act.TogglePaneZoomState,
        },
        {
            key = "l",
            mods = "ALT|SHIFT",
            action = "ShowLauncher",
        },
        {
            key = "l",
            mods = "CTRL|ALT",
            action = act.SendKey({ key = "l", mods = "CTRL|ALT" }),
        },
        {
            key = "f",
            mods = "CTRL|ALT",
            action = act.SendKey({ key = "f", mods = "CTRL|ALT" }),
        },
        {
            key = "|",
            mods = "CTRL|ALT|SHIFT",
            action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
        },
        {
            key = "_",
            mods = "CTRL|ALT|SHIFT",
            action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
        },
        {
            key = "%",
            mods = "CTRL|ALT|SHIFT",
            action = act.SendKey({ key = "%", mods = "CTRL|ALT" }),
        },
        {
            key = '"',
            mods = "CTRL|ALT|SHIFT",
            action = act.SendKey({ key = '"', mods = "CTRL|ALT" }),
        },
    },
}
