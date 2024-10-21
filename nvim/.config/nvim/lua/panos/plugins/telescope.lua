return {
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-media-files.nvim" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{ "nvim-telescope/telescope-symbols.nvim" }, -- symbols
	{ "jvgrootveld/telescope-zoxide" }, -- integration with zoxide
	{ "nvim-telescope/telescope-project.nvim" }, -- switch between projects
	{
		"nvim-telescope/telescope-frecency.nvim", -- intelligent prioritization when selecting files from your editing history.
		config = function()
			require("telescope").load_extension("frecency")
		end,
	},
	{ "nvim-telescope/telescope-ui-select.nvim" }, -- It sets vim.ui.select to telescope
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "ElPiloto/telescope-vimwiki.nvim" },
}
