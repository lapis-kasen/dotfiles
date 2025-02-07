return {
  "xiyaowong/telescope-emoji.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = function ()
    require("telescope").load_extension("emoji")
  end
}
