return {
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.opt.termguicolors = true
      require('notify').setup({
        background_colour = '#000000',
        level = vim.log.levels.ERROR,
        merge_duplicates = true
      })
    end,
  }
}
