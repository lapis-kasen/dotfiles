return {
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    event = { "VeryLazy" },
    config = function()
      require('lspsaga').setup({
        ui = {
          border = 'single',
          devicon = true,
          title = true,
        },
        symbol_in_winbar = {
          enable = true,
        },
        lightbulb = {
          enable = true,
          sign = true,
          virtual_text = true,
        },
        outline = {
          win_width = 50,
          auto_preview = true,
        },
      })
    end,
    keys = {
      {
        "<leader>bk",
        "<cmd>Lspsaga hover_doc<cr>",
        desc = "Lspsaga hover doc",
      },
      {
        "<leader>bf",
        "<cmd>Lspsaga finder<cr>",
        desc = "Lspsaga finder",
      },
      {
        "<leader>bo",
        "<cmd>Lspsaga outline<cr>",
        desc = "Lspsaga outline",
      },
      {
        "<leader>br",
        "<cmd>Lspsaga rename<cr>",
        desc = "Lspsaga rename",
      },
      {
        "<leader>ba",
        "<cmd>Lspsaga code_action<cr>",
        desc = "Lspsaga code_action",
      },
      {
        "<leader>bci",
        "<cmd>Lspsaga incoming_calls<cr>",
        desc = "Lspsaga incoming calls",
      },
      {
        "<leader>bco",
        "<cmd>Lspsaga outgoing calls<cr>",
        desc = "Lspsaga outgoing calls",
      },
    },
  }
}
