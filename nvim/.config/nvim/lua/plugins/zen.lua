return {
	{
		{
			"folke/zen-mode.nvim",
			opts = {
				plugins = {
					gitsigns = {enabled = false},
					tmux = {enabled = true},
				},
			},
			keys = { { "<leader>z", "<cmd>ZenMode<CR>", desc = "Zen Mode" } },
		},
	},
}
