return {
	-- { "stevearc/dressing.nvim" }, -- A plugin for applying a consistent style to your Neovim UI

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
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					-- command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
	},

	{ -- add filetype signs to your plugins
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			local ibl = require("ibl")
			ibl.setup({
				scope = { enabled = false },
				indent = { char = "┊" },
			})
		end,
	},
}
