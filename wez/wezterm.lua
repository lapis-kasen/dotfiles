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
    initial_rows = 32,
    initial_cols = 130,

    default_prog = { "wsl", "~" },
    launch_menu = launch_menu,

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
    -- window_background_opacity = 0.95,
    -- text_background_opacity = 0.95,
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
            key = "w",
            mods = "ALT|SHIFT",
            action = wezterm.action({ CloseCurrentPane = { confirm = true } }),
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
