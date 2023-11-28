return {
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "shaunsingh/nord.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.opt.termguicolors = true
      local highlights = require("nord").bufferline.highlights({
        italic = true,
        bold = true,
      })
      require("bufferline").setup({
        options = {
          separator_style = "slant",
        },
        highlights = highlights,
      })
    end,
  }
}
