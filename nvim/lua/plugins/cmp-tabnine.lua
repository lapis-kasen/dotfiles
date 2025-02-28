return {
  "tzachar/cmp-tabnine",
  build = "./install.sh",
  dependencies = {
    "Saghen/blink.cmp"
  },
  config = function ()
    local tabnine = require("cmp_tabnine.config")

    tabnine:setup({
      max_lines = 1000,
      max_rum_results = 20,
    })
  end,
}
