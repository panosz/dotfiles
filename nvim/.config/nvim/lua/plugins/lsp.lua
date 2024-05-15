return {

	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "j-hui/fidget.nvim" },
	{ "folke/neodev.nvim" }, -- Additional lua configuration, makes nvim stuff amazing
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
	},
	{ -- For non-lsp sources, such as linters
		"nvimtools/none-ls.nvim", -- replacement for "jose-elias-alvarez/null-ls.nvim",
		"jayp0521/mason-null-ls.nvim",
	},

	{ "ray-x/lsp_signature.nvim" }, -- show function signature when you type

	{ "onsails/lspkind-nvim" }, -- vscode-like pictograms for neovim lsp completion items
}
