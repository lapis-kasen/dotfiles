return {
  "onsails/diaglist.nvim",
  event = { "WinEnter", "BufEnter", "QuickFixCmdPre" },
  config = function ()
    require("diaglist").init({
      debug = false,

      debounce_ms = 150,
    })
  end
}
