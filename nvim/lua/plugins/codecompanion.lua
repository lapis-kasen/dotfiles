return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" },
    },
    {
      "HakonHarnes/img-clip.nvim",
      opts = {
        filetypes = {
          codecompanion = {
            prompt_for_file_name = false,
            template = "[Image]($FILE_PATH)",
            use_absolute_path = true,
          },
        },
      },
    },
    {
      "echasnovski/mini.diff",
      config = function()
        local diff = require("mini.diff")
        diff.setup({
          source = diff.gen_source.none(),
        })
      end,
    },
  },
  opts = {
    opts = {
      language = "Japanese"
    },
    display = {
      chat = {
        -- auto_scroll = false,
        show_header_separator = true,
        window = {
          layout = "vertical"
        },
      },
      diff = {
        enabled = true,
        close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
        layout = "vertical", -- vertical|horizontal split for default provider
        opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
        provider = "mini_diff"
      },
    },
    strategies = {
      chat = {
        adapter = "proxy_adapter",
        roles = {
          llm = function(adapter)
            return "  CodeCompanion (" .. adapter.formatted_name .. ")"
          end,
          user = "  Me"
        },
      },
      inline = {
        adapter = "proxy_adapter",
      },
      opts = {
        completion_provider = "blink",
      },
    },
    adapters = {
      ---@class CodeCompanion.Adapter
      proxy_adapter = function()
        return require("codecompanion.adapters").extend("openai", {
          url = os.getenv("OPENAI_API_BASE"),
          env = {
            api_key = "OPENAI_API_KEY",
            chat_url = "",
            models_endpoint = "",
          },
          headers = {
            ["Content-Type"] = "application/json",
            ["api-key"] = "${api_key}",
          },
          schema = {
            model = {
              default = "gpt-4o"
            },
          }
        })
      end,
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true
        }
      }
    }
  },
}
