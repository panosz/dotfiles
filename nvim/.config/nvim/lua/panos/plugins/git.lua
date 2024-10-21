return {
	{ "tpope/vim-fugitive" },
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{ "tpope/vim-rhubarb"}, -- A git commit browser.
	{ "junegunn/gv.vim"}, -- If fugitive.vim is the Git, rhubarb.vim is the Hub
	{
		"wintermute-cell/gitignore.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim", -- optional: for multi-select
		},
	},

	{ dependencies = "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" }, -- review all changed files for any git rev.

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
	},

	{ "rbong/vim-flog" }, -- a git log viewer
}
