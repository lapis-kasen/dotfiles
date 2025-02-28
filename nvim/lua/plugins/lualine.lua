return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "AlexvZyl/nordic.nvim",
      "arkav/lualine-lsp-progress",
    },
    event = "VeryLazy",
    config = function()
      -- nordic theme override
      local nordic_theme = require("lualine.themes.nordic")
      local nordic_palette = require("nordic.colors")
      -- normal mode
      nordic_theme.normal.a.bg = nordic_palette.blue0
      nordic_theme.normal.a.fg = nordic_palette.fg_bright
      nordic_theme.normal.a.gui = ""
      -- insert
      nordic_theme.insert.a.bg = nordic_palette.green.dim
      nordic_theme.insert.a.fg = nordic_palette.fg_bright
      nordic_theme.insert.a.gui = ""
      -- visual
      nordic_theme.visual.a.gui = ""
      -- command
      nordic_theme.command.a.gui = ""
      -- replace
      nordic_theme.replace.a.gui = ""
      -- terminal
      nordic_theme.terminal.a.gui = ""

      require'lualine'.setup {
        options = {
          icons_enabled = true,
          theme = nordic_theme,  -- from nordic.nvim
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename', 'lsp_progress'},
          lualine_x = {'tabline', 'encoding', 'fileformat', 'filetype'},
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
        extensions = {'quickfix', 'nvim-tree', 'fugitive', "mason", "lazy", "trouble", "toggleterm"}
      }
    end,
  }
}
