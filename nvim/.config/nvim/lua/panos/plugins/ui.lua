return {
	{ "stevearc/dressing.nvim" }, -- A plugin for applying a consistent style to your Neovim UI

	-- {
	-- "VonHeikemen/fine-cmdline.nvim",
	-- dependencies = {
	-- { "MunifTanjim/nui.nvim" },
	-- },
	-- config = function()
	-- require("fine-cmdline").setup({
	-- popup = {
	-- position = {
	-- row = "50%",
	-- col = "50%",
	-- },
	-- },
	-- })
	-- end,
	-- vim.api.nvim_set_keymap("n", "\\", "<cmd>FineCmdline<CR>", { noremap = true }),
	-- },

	{ "rcarriga/nvim-notify" },
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	--{{{ devicons - add filetype signs to your plugins
	{
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},
	--}}}
}
