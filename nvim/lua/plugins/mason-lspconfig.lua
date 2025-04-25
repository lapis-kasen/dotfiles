return
{
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "saghen/blink.cmp",
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
          "ansiblels",
          "bashls",
          "buf_ls",
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
    },
    config = function (_, opts)
      require('mason').setup()
      require('mason-lspconfig').setup(opts)

      require('mason-lspconfig').setup_handlers ({
        function(server_name)
          local lspconfig = require("lspconfig")
          ---@type lspconfig.Config
          local server_opts = {}
          local ok, cmp = pcall(require, "blink-cmp")
          if ok then
            server_opts.capabilities = cmp.get_lsp_capabilities()
          end
          --- venv support for python project
          if server_name == "pyright" then
            server_opts.settings = {
              python = {
                venvPath = '.',
                pythonPath = './.venv/bin/python',
                analysis = {
                  extraPaths = {'.'}
                }
              }
            }
          end

          --- buttom of setup_handlers
          lspconfig[server_name].setup(server_opts)
        end,
      })
      vim.cmd("LspStart")
    end,
  }
}
