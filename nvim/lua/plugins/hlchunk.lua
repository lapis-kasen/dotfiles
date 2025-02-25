return
{
  {
    "shellRaining/hlchunk.nvim",
    event = { "VeryLazy" },
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,
          exclude_filetypes = {
            markdown = true,
          },
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "┌",
            left_bottom = "└",
            right_arrow = "─",
          },
          style = "#00ffff",
          duration = 100,
          delay = 30,
        },
        indent = {
          enable = true
        }
      })
    end
  },
}
