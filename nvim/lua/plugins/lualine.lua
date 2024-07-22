return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "shaunsingh/nord.nvim",
    },
    event = "VeryLazy",
    config = function()
      require'lualine'.setup {
        options = {
          icons_enabled = true,
          theme = 'nord',  -- from nord.nvim
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics', 'g:coc_status'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        extensions = {'quickfix', 'nerdtree', 'fugitive'}
      }
    end,
  }
}
