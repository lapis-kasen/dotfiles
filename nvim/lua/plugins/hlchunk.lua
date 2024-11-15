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
          }
        },
        indent = {
          enable = true
        }
      })
    end
  },
}
