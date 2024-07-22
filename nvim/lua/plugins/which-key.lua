return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
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
