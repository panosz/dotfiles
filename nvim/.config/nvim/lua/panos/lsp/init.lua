local neodev_status, neodev = pcall(require, "neodev")
if neodev_status then
	neodev.setup({
		library = { plugins = { "nvim-dap-ui" }, types = true },
	})
end

local lspconfig_status, _ = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

require("panos.lsp.mason_config")
require("panos.lsp.handlers").setup()
-- Turn on lsp status information
require("fidget").setup()
