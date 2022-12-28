-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  eslint = {},
  rome = {},
  volar = {},
  vuels = {},
  pylsp = {},
  jsonls = require("panos.lsp.settings.jsonls"),
  clangd = {},
  pyright = require("panos.lsp.settings.pyright"),
  texlab = require("panos.lsp.settings.texlab"),
}


-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

local handlers = require("panos.lsp.handlers")

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = handlers.capabilities,
      on_attach = handlers.on_attach,
      settings = servers[server_name],
    }
  end,
}


local null_ls = require("null-ls")
null_ls.setup({
    sources = {
       null_ls.builtins.diagnostics.flake8,
       null_ls.builtins.diagnostics.chktex
     }
  }
)
require("mason-null-ls").setup({
    ensure_installed = nil,
    automatic_installation = true,
    automatic_setup = false,
})