return {

	{ "rcarriga/nvim-notify" },

	-- status line{{{
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
		lazy = false,
		priority = 1010,
		config = function()
			local lualine = require("lualine")
			lualine.setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = true,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = {
						{
							"filename",
							path = 1, -- 0: Just the filename
							-- 1: Relative path
							-- 2: Absolute path

							shorting_target = 60, -- Shortens path to leave 60 spaces in the window
							-- for other components. (terrible name, any suggestions?)
						},

						{ -- show macro recording in statusline
							require("noice").api.status.mode.get,
							cond = require("noice").api.status.mode.has,
							color = { fg = "#ff9e64" },
						},
					},
					lualine_x = { "copilot", "filetype" },
					lualine_y = { "aerial" },
					lualine_z = { "location", "progress" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = { "aerial", "fugitive", "lazy", "mason", "nvim-tree", "quickfix", "toggleterm" },
			})
		end,
	},
	--}}}
	-- tabline{{{
	{
		"romgrk/barbar.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	--}}}

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
