return {
  "j-hui/fidget.nvim",
  event = "VeryLazy",
  opts = {
    integration = {
      ["nvim-tree"] = {
        enable = true,              -- Integrate with nvim-tree/nvim-tree.lua (if installed)
      },
    },
  },
}
