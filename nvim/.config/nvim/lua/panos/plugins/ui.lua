return {
	{
		"VonHeikemen/fine-cmdline.nvim",
		dependencies = {
			{ "MunifTanjim/nui.nvim" },
		},
		config = function()
			require("fine-cmdline").setup({
				popup = {
					position = {
						row = "50%",
						col = "50%",
					},
				},
			})
		end,
		vim.api.nvim_set_keymap("n", "\\", "<cmd>FineCmdline<CR>", { noremap = true }),
	},

	{ "rcarriga/nvim-notify" },

	--{{{ devicons - add filetype signs to your plugins
	{
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},
	--}}}

}
