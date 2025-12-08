-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
	eslint = {},
	biome = {},
	vue_ls = {},
    pylsp = {
      pylsp = {       -- needs a seemingly redundant pylsp key, see https://vi.stackexchange.com/a/39768/32018
        plugins = {
          jedi_completion = { include_params = true },
          pycodestyle = { enabled = false },
        }
      },
    },
    vuels = {},
	jsonls = require("plugins.lsp.settings.jsonls"),
	clangd = require("plugins.lsp.settings.clangd"),
	-- pyright = require("panos.lsp.settings.pyright"),
	texlab = require("plugins.lsp.settings.texlab"),
	-- ltex = {
		-- root_dir = function(fname)
			-- return require("lspconfig").util.find_git_ancestor(fname)
		-- end,
        -- enabled = {latex = "latex", "tex", "bib"},
	-- },
	rust_analyzer = {
		checkOnSave = {
			command = "clippy",
		},
	},
}

-- Setup mason so it can manage external tooling
require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

local handlers = require("panos.lsp.handlers")

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = handlers.capabilities,
			on_attach = handlers.on_attach,
			settings = servers[server_name],
		})
	end,
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		--null_ls.builtins.diagnostics.flake8.with({
			--extra_args = { "--extend-ignore=E203,E501,W503,W504" }, -- ignore line break after binary operator
		--}),
		null_ls.builtins.code_actions.refactoring,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.black.with({
			extra_args = { "--line-length", "88" },
		}),
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.diagnostics.zsh,
		null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.cmake_format,
	},
})
require("mason-null-ls").setup({
	ensure_installed = nil,
	automatic_installation = true,
	automatic_setup = false,
})
