return {
	eslint = {},
	biome = {},
	volar = {},
	pylsp = {
		pylsp = {
			plugins = {
				pycodestyle = { enabled = false },
				pyflakes = { enabled = false },
				pylint = { enabled = false },
				jedi_completion = { enabled = true },
				mccabe = { enabled = false },
				mypy = { enabled = false },
				pydocstyle = { enabled = false },
				rope_completion = { enabled = false },
				yapf = { enabled = false },
				pyls_isort = { enabled = false },
				pyls_black = { enabled = false },
			},
		},
	},
	vuels = {},
	jsonls = require("panos.plugins.lsp.settings.jsonls"),
	clangd = require("panos.plugins.lsp.settings.clangd"),
	-- pyright = require("panos.lsp.settings.pyright"),
	texlab = require("panos.plugins.lsp.settings.texlab"),
	-- ltex = {
	-- root_dir = function(fname)
	-- return require("lspconfig").util.find_git_ancestor(fname)
	-- end,
	-- enabled = {latex = "latex", "tex", "bib"},
	-- },
	rust_analyzer = {},
}
