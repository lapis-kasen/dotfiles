return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
      require'nvim-treesitter.configs'.setup{
        ensure_installed = {
          "c",
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
        },
        highlight = {
          enable = true,
          disable = {},
        },
      }
    end,
  }
}
