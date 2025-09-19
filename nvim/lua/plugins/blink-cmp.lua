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

    version = "1.*",
    -- optional: provides snippets for the snippet source
    dependencies = {
      "rafamadriz/friendly-snippets",
      "xzbdmw/colorful-menu.nvim",
      "ribru17/blink-cmp-spell",
      "Kaiser-Yang/blink-cmp-avante",
      "obsidian-nvim/obsidian.nvim"
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
        preset = 'enter',
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<S-TAB>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<TAB>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<ENTER>'] = { 'accept', 'fallback' }
      },

      signature = {
        enabled = true,
        window = {
          border = "solid",
          show_documentation = false,
        }
      },

      appearance = {
        highlight_ns = vim.api.nvim_create_namespace("blink.cmp"),
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'normal',
      },

      completion = {
        keyword = {
          range = "prefix",
        },
        list = {
          selection = {
            auto_insert = true
          }
        },
        ghost_text = {
          enabled = false
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = { border = "solid" }
        },
        menu = {
          border = "solid",
          draw = {
            align_to = "label",
            padding = { 0, 1 },
            gap = 1,
            columns = { { "kind_icon" }, { "label", gap = 1 }, { "kind" } },
            components = {
              label = {
                -- width = { fill = true, max = 60 },
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
            treesitter = { 'lsp' },
          },
        },
        accept = {
          dot_repeat = true,
          create_undo_point = true,
          auto_brackets = {
            enabled = true,
            default_brackets = { "(", ")" },
            kind_resolution = {
              enabled = true,
              blocked_filetypes = { "typescriptreact", "javascriptreact", "vue" },
            },
            semantic_token_resolution = {
              enabled = true,
              blocked_filetypes = { "java" },
            }
          },
        }
      },
      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'avante', 'obsidian', 'lsp', 'path', 'snippets', 'buffer', "lazydev", "spell", "cmdline" },
        providers = {
          avante = {
            module = 'blink-cmp-avante',
            name = 'Avante',
            opts = {},
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
          spell = {
            name = 'Spell',
            module = 'blink-cmp-spell',
            opts = {
              -- EXAMPLE: Only enable source in `@spell` captures, and disable it
              -- in `@nospell` captures.
              enable_in_context = function()
                local curpos = vim.api.nvim_win_get_cursor(0)
                local captures = vim.treesitter.get_captures_at_pos(
                  0,
                  curpos[1] - 1,
                  curpos[2] - 1
                )
                local in_spell_capture = false
                for _, cap in ipairs(captures) do
                  if cap.capture == 'spell' then
                    in_spell_capture = true
                  elseif cap.capture == 'nospell' then
                    return false
                  end
                end
                return in_spell_capture
              end,
            },
          },
          cmdline = {
            min_keyword_length = function (ctx)
              if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
                return 3
              end
              return 0
            end
          },
        },
      },
      cmdline = {
        completion = {
          ghost_text = { enabled = true },
          menu = { auto_show = true },
          list = {
            selection = {
              auto_insert = true
            }
          }
        },
        keymap = {
          preset = "enter",
          ['<Up>'] = { 'select_prev', 'fallback' },
          ['<S-TAB>'] = { 'select_prev', 'snippet_backward', 'fallback' },
          ['<Down>'] = { 'select_next', 'fallback' },
          ['<TAB>'] = { 'select_next', 'snippet_forward', 'fallback' },
          ['<ENTER>'] = { 'accept', 'fallback' }
        }
      },
      fuzzy = {
        sorts = {
          function(a, b)
            local sort = require('blink.cmp.fuzzy.sort')
            if a.source_id == 'spell' and b.source_id == 'spell' then
              return sort.label(a, b)
            end
          end,
          -- This is the normal default order, which we fall back to
          'score',
          'kind',
          'label',
        },
      },
    },
    opts_extend = { "sources.default" }
  }
}
