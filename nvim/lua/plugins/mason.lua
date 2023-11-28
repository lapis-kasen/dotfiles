return {
  {
    "williamboman/mason.nvim",
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
