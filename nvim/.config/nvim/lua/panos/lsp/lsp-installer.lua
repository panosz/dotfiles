local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
local function my_custom_attach(client, bufnr)
  require("panos.lsp.handlers").on_attach(client, bufnr)
  -- require("aerial").on_attach(client, bufnr)
end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = my_custom_attach,
		capabilities = require("panos.lsp.handlers").capabilities,
	}

	 if server.name == "jsonls" then
	 	local jsonls_opts = require("panos.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

     -- if server.name == "sumneko_lua" then
         -- local sumneko_opts = require("panos.lsp.settings.sumneko_lua")
         -- opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
     -- end

	 if server.name == "pyright" then
	 	local pyright_opts = require("panos.lsp.settings.pyright")
	 	opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	 end

     if server.name == "texlab" then
         local texlab_opts = require("panos.lsp.settings.texlab")
         opts = vim.tbl_deep_extend("force", texlab_opts, opts)
     end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
