return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  config = function()
    local mason = require("mason")

    local mason_lspconfig = require("mason-lspconfig")

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
      automatic_installation = true,
    })
  end,
}
