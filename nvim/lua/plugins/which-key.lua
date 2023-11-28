return {
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      local wk = require("which-key")
      -- <leader> commands
      wk.register({
        -- telescope
        f = {
          name = "file",
          f = { "<cmd> Telescope find_files<CR>", "Find File" },
          g = { "<cmd> Telescope live_grep<CR>", "Live Grep" },
          b = { "<cmd> Telescope buffers<CR>", "Show buffers" },
          h = { "<cmd> Telescope help_tags<CR>", "Help Tags" },
        },
        x = {
          name = "trouble",
          d = { "<cmd>Trouble document_diagnostics<cr>", "Trouble document_diagnostics" },
          l = { "<cmd>Trouble loclist<cr>", "Trouble loclist" },
          q = { "<cmd>Trouble quickfix<cr>", "Trouble quickfix" },
          r = { "<cmd>Trouble lsp_references<cr>", "Trouble lsp_references" },
          t = { "<cmd>TroubleToggle<cr>", "Trouble toggle" },
          w = {
            "<cmd>Trouble workspace_diagnostics<cr>",
            "Trouble workspace_diagnostics",
          },
        },
      },
      {
        prefix = "<leader>"
      })
      -- nomal keymap w/o <leader>
      wk.register({
        K = { "<cmd> Lspsaga hover_doc<CR>", "Show hover info" },
        g = {
          r = { "<cmd> Lspsaga lsp_finder<CR>", "LSP finder" },
      i = { "<cmd>Lspsaga incoming_calls<CR>", "Incoming calls" },
      o = { "<cmd>Lspsaga outgoing_calls<CR>", "Ougoing calls" },
      d = { "<cmd>Lspsaga peek_definition<CR>", "Peek definition" },
      a = { "<cmd>Lspsaga code_action<CR>", "Code action" },
      n = { "<cmd>Lspsaga rename<CR>", "Rename" },
      e = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Show line diagnostics" }
        },
      })

    end,
  }
}
