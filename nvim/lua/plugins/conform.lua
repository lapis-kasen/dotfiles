return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = {
    ---@type nil|table<string, conform.FiletypeFormatter>
    formatters_by_ft = {
      lua = { "stylua" },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      python = { "black", "isort", "ruff" },
    }
  },
}
