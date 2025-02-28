return {
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "AlexvZyl/nordic.nvim",
    },
    event = "VeryLazy",
    config = function()
      vim.opt.termguicolors = true
      local colors = require("nordic.colors")
      require("bufferline").setup({
        options = {
          separator_style = "thin",
          diagnostics = "nvim_lsp",
        },
        highlights = {
          fill = { bg = colors.bg_dark },
          buffer_selected = { bold = true },
          diagnostic_selected = { bold = true },
          info_selected = { bold = true },
          info_diagnostic_selected = { bold = true },
          warning_selected = { bold = true },
          warning_diagnostic_selected = { bold = true },
          error_selected = { bold = true },
          error_diagnostic_selected = { bold = true },
        },
      })
    end,
    keys = {
      {
        "<S-Right>",
        "<cmd>bn<cr>",
        desc = "buffer next"
      },
      {
        "<S-Left>",
        "<cmd>bp<cr>",
        desc = "buffer prev"
      }
    }
  }
}
