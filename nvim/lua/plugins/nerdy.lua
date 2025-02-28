return {
  "2kabhishek/nerdy.nvim",
  dependencies = {
    -- "stevearc/dressing.nvim",
    "nvim-telescope/telescope.nvim"
  },
  cmd = "Nerdy",
  config = function ()
    require("telescope").extensions.nerdy.nerdy()
  end
}
