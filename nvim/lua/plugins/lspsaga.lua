return {
  {
    "nvimdev/lspsaga.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('lspsaga').setup({
        ui = {
          border = 'single',
          devicon = true,
          expand = 'm',
          title = true,
        },
        symbol_in_winbar = {
          enable = true,
        },
        lightbulb = {
          enable = true,
          sign = false,
          virtual_text = false,
        },
        outline = {
          win_width = 50,
          auto_preview = true,
        },
      })
      vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>")
      -- vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>")
      vim.keymap.set("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]])
    end,
  }
}
