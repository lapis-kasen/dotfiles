return {
  {
    "shaunsingh/nord.nvim",
    event = "VimEnter",
    priority = 1000,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_disable_background = true
      vim.g.nord_italic = true
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = true
      vim.g.nord_cursorline_transparent = true

      require("nord").set()
    end,
  }
}
