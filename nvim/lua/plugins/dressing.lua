return {
  "stevearc/dressing.nvim",
  event = "BufEnter",
  opt = {},
  config = function ()
    require("dressing").setup({
      input = {
        enabled = true,
        win_options = {
          winhighlight = "NormalFloat:DiagnosticError"
        }
      }
    })
  end,
}
