return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
      require'nvim-treesitter.configs'.setup{
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
        }
      }
    end,
  }
}
