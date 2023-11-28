return {
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<C-n>", "<cmd> NvimTreeToggle<CR>", desc = "Toggle NvimTree" }
    },
    config = function()
      -- disable netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- set termguicolors to enable highlight groups
      vim.opt.termguicolors = true

      require('nvim-tree').setup({
        sort_by = 'case_sensitive',
        on_attach = on_attach,
        view = {
          adaptive_size = true,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })
    end,
  }
}
