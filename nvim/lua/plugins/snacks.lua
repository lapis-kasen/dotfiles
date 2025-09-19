return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      sections = {
        {
          section = "terminal",
          cmd = "art text NVIM isometric | tte --anchor-canvas s beams --beam-delay 5 --beam-row-speed-range 20-60 --beam-column-speed-range 8-12 --final-gradient-direction diagonal",
          height = 15,
          padding = 1,
          ttl = 0,
        },
        { section = "keys" },
        { section = "startup" },
      }
    },
    image = { enabled = true },
    -- explorer = { enabled = true },
    -- indent = { enabled = true },
    input = {
      enabled = true,
      icon = " ",
      icon_hl = "SnacksInputIcon",
      icon_pos = "left",
      prompt_pos = "title",
      win = { style = "input" },
      expand = true,
    },
    styles = {
      float = {
        position = "float",
        border = "rounded",
        backdrop = 60,
        height = 0.9,
        width = 0.9,
        zindex = 50,
      },
      input = {
        backdrop = false,
        position = "float",
        border = "rounded",
        title_pos = "center",
        height = 1,
        width = 60,
        relative = "editor",
        noautocmd = true,
        row = 2,
        -- relative = "cursor",
        -- row = -3,
        -- col = 0,
        wo = {
          winhighlight = "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle",
          cursorline = false,
        },
        bo = {
          filetype = "snacks_input",
          buftype = "prompt",
        },
        --- buffer local variables
        b = {
          completion = false, -- disable blink completions in input
        },
        keys = {
          n_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "n", expr = true },
          i_esc = { "<esc>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
          i_cr = { "<cr>", { "cmp_accept", "confirm" }, mode = "i", expr = true },
          i_tab = { "<tab>", { "cmp_select_next", "cmp" }, mode = "i", expr = true },
          i_ctrl_w = { "<c-w>", "<c-s-w>", mode = "i", expr = true },
          i_up = { "<up>", { "hist_up" }, mode = { "i", "n" } },
          i_down = { "<down>", { "hist_down" }, mode = { "i", "n" } },
          q = "cancel",
        },
      }
    }
  },
}
