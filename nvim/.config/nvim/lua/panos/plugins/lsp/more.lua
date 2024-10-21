return {

	{ "j-hui/fidget.nvim" },
	{ "folke/neodev.nvim" }, -- Additional lua configuration, makes nvim stuff amazing
	{ -- For non-lsp sources, such as linters
		"nvimtools/none-ls.nvim", -- replacement for "jose-elias-alvarez/null-ls.nvim",
		"jayp0521/mason-null-ls.nvim",
	},

	{ "onsails/lspkind-nvim" }, -- vscode-like pictograms for neovim lsp completion items
}
