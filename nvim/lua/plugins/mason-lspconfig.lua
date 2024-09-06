return
{
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    event = "BufEnter",
    config = function ()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          "ansiblels",
          "bashls",
          "bufls",
          "docker_compose_language_service",
          "dockerls",
          "gopls",
          "jsonls",
          "lua_ls",
          "pyright",
          "svelte",
          "vimls",
          "yamlls",
        },
        automatic_installation = true,
      })

      local on_attach = function(_, _)  -- client, bufnr
        vim.lsp.codelens.refresh()
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )

      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        end,
      })

      require('mason-lspconfig').setup_handlers ({
        function(server_name)
          require('lspconfig')[server_name].setup ({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
        -- for python poetry env
        ["pyright"] = function ()
          require('lspconfig').pyright.setup {
            settings = {
              python = {
                venvPath = '.',
                pythonPath = './.venv/bin/python',
                analysis = {
                  extraPaths = {'.'}
                }
              }
            }
          }
        end,
      })
      vim.cmd("LspStart")
      -- Sign Definition
      vim.fn.sign_define(
      "DiagnosticSignError",
      { text = " ", texthl = "DiagnosticSignError" }
      )
      vim.fn.sign_define(
      "DiagnosticSignWarn",
      { text = " ", texthl = "DiagnosticSignWarn" }
      )
      vim.fn.sign_define(
      "DiagnosticSignInfo",
      { text = " ", texthl = "DiagnosticSignInfo" }
      )
      vim.fn.sign_define(
      "DiagnosticSignHint",
      { text = " ", texthl = "DiagnosticSignHint" }
      )
    end,
  }
}
