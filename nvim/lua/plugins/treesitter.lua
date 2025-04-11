return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    cmd = {
      "TSUpdateSync",
      "TSUpdate",
      "TSInstall",
    },
    build = ":TSUpdate",
    keys = {
      { "<c-space>", desc = "Inscrement Selection" },
      { "<bs>", desc = "Decrement Selection", mode = "x" },
    },
    opts_extend = { "ensure_installed" },
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      ensure_installed = {
        "cpp",
        "regex",
        "yaml",
        "json",
        "python",
        "toml",
        "lua",
        "fish",
        "go",
        "markdown",
        "markdown_inline",
        "java",
        "kotlin",
        "vim",
        "vimdoc",
        "bash",
      },
      highlight = {
        enable = true,
        disable = {},
      },
      fold = {
        enable = true,
        disable = {}
      },
      indent = {
        enable = false
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        }
      }
    },
    ---@param opts TSConfig
    config = function (_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  }
}
