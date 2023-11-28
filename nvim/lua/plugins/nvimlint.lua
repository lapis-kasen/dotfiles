return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      require('lint').linters_by_ft = {
        python = {'ruff',},
        golang = {'golangcilint',}
      }
      -- "BufWritePost", "InsertLeave", "TextChanged"
      vim.api.nvim_create_autocmd({ "InsertLeave" }, {
        callback = function ()
          require("lint").try_lint()
        end,
      })
    end,
  }
}
