return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({
        preset = "modern"
      })
      vim.api.nvim_set_hl(0, "WhichKeyBorder", { link = "WhichKey"})
    end,
    keys = {
      -- Telescope
      {
        "<leader>f",
        group = "Telescope",
      },
      {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "Find File",
        mode = "n"
      },
      {
        "<leader>fg",
        "<cmd>Telescope live_grep<cr>",
        desc = "Live Grep",
        mode = "n"
      },
      {
        "<leader>ftd",
        "<cmd>TodoTelescope<cr>",
        desc = "Todo Telescope"
      },
      {
        "<leader>ftt",
        "<cmd>TodoTrouble<cr>",
        desc = "lookup TodoTrouble"
      }
    },
  }
}
