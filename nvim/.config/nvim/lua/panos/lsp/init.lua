local neodev_status, neodev = pcall(require, "neodev")
if neodev_status then
  neodev.setup({})
end

local lspconfig_status, _ = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

require("panos.lsp.lsp-installer")
require("panos.lsp.handlers").setup()
