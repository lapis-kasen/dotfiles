return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  opts = {
    preset = "powerline",
    -- transparent_bg = "true",
    vim.diagnostic.config(
    {
      virtual_text = false,
      underline = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = " ",
          [vim.diagnostic.severity.HINT] = " ",
        },
      },
    }),
    options = {
      show_source = false,
      use_icons_from_diagnostic = true,
      add_messages = true,
      multiple_diag_under_cursor = true,
      show_all_diags_on_cursorline = true,

      multilines = {
        enabled = true,
        always_show = true,
      },

      enable_on_insert = false,
      enable_on_select = false,

      overflow = {
        mode = "wrap",
      },

      virt_texts = {
        priority = 2048
      },

      severity = {
        vim.diagnostic.severity.ERROR,
        vim.diagnostic.severity.WARN,
        vim.diagnostic.severity.INFO,
        vim.diagnostic.severity.HINT,
      },
    },
  },
}
