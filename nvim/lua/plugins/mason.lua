return {
  {
    "williamboman/mason.nvim",
    version = "^1.0.0",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
      "MasonUpdate",
    },
    config = function()
      -- mason
      require('mason').setup()
    end,
  }
}
