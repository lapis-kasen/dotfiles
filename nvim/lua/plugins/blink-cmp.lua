return {
  -- blink compat
  {
    "saghen/blink.compat",
    lazy = true,
    opts = {},
  },
  -- blink
  {
    'saghen/blink.cmp',

    version = "v0.11.0",
    -- optional: provides snippets for the snippet source
    dependencies = {
      "rafamadriz/friendly-snippets",
      "xzbdmw/colorful-menu.nvim",
      "tzachar/cmp-tabnine",
    },
    event = "BufEnter",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = {
        preset = 'default',
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<S-TAB>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<TAB>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<ENTER>'] = { 'accept', 'fallback' }
      },

      signature = {
        enabled = true
      },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'normal'
      },

      completion = {
        keyword = {
          range = "prefix",
        },
        ghost_text = {
          enabled = false
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        menu = {
          draw = {
            align_to = "label",
            padding = 1,
            gap = 1,
            columns = { { "kind_icon" }, { "label", gap = 1 }, { "kind" }, { "source_name" } },
            components = {
              label = {
                width = { fill = true, max = 60 },
                text = function(ctx)
                  local highlights_info = require("colorful-menu").blink_highlights(ctx)
                  if highlights_info ~= nil then
                    -- Or you want to add more item to label
                    return highlights_info.label
                  else
                    return ctx.label
                  end
                end,
                highlight = function(ctx)
                  local highlights = {}
                  local highlights_info = require("colorful-menu").blink_highlights(ctx)
                  if highlights_info ~= nil then
                    highlights = highlights_info.highlights
                  end
                  for _, idx in ipairs(ctx.label_matched_indices) do
                    table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
                  end
                  -- Do something else
                  return highlights
                end,
              },
            },
            treesitter = { 'lsp' },
          },
        },
      },
      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', "tabnine", "lazydev" },
        cmdline = {},
        providers = {
          tabnine = {
            name = "TabNine",
            module = "blink.compat.source",
            score_offset = 100,
            async = true,
            opts = {
              cmp_name = "cmp_tabnine",  -- actual provider name
            }
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          }
        },
      },
    },
    opts_extend = { "sources.default" }
  }
}
