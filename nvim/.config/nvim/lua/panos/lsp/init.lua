local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end
require("panos.lsp.lsp-installer")
require("panos.lsp.handlers").setup()
