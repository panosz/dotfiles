return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  config = function()
    local mason = require("mason")

    local mason_lspconfig = require("mason-lspconfig")

    local orig = mason_lspconfig.setup_handlers

    mason_lspconfig.setup_handlers = function(handlers)
      vim.notify("[mason-lspconfig] setup_handlers called", vim.log.levels.INFO)
      return orig(handlers)
    end

    local servers = require("plugins.lsp.settings.servers")
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
      -- auto-install configured servers (with lspconfig)
      -- automatic_installation = true,
    })
  end,
}
