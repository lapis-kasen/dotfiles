return {
  "obsidian-nvim/obsidian.nvim",
  ft = "markdown",
  event = "BufEnter",

  ---@module "obsidian"
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal"
      },
      {
        name = "work",
        path = "~/vaults/work"
      }
    },
    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
      create_new = true,
    }
  }
}
