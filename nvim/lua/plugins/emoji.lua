return {
  "allaman/emoji.nvim",
  ft = { "markdown", "toml" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim"
  },
  config = function (_, opts)
    require("emoji").setup(opts)
    local ts = require("telescope").load_extension "emoji"
    vim.keymap.set("n", "<leader>se", ts.emoji, { desc = "[S]earch [E]moji"})
  end,
}
