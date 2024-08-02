return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    event = { "VeryLazy" },
    config = function ()
      -- nvim lsp
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        end,
      })
      require('mason-lspconfig').setup()
      require('mason-lspconfig').setup_handlers({ function(server_name)
        local opts = {}
        require('lspconfig')[server_name].setup({
          on_attach = opts.on_attach,
          capabilities = require('cmp_nvim_lsp').default_capabilities(
          vim.lsp.protocol.make_client_capabilities()
          ),
        })
        -- for python poetry env
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
        -- protobuf
        require('lspconfig').bufls.setup{}
      end })
    end,
  }
}
