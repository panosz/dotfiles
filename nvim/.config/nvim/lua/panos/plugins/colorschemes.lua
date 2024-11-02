return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local kanagawa = require("kanagawa")
			kanagawa.setup({
				overrides = function(colors)
					local theme = colors.theme
					return {
						--  This will make floating windows look nicer with default borders. see https://github.com/rebelot/kanagawa.nvim#transparent-floating-windows
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },

						-- Save an hlgroup with dark background and dimmed foreground
						-- so that you can use it where your still want darker windows.
						-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

						-- Popular plugins that open floats will link to NormalFloat by default;
						-- set their background accordingly if you wish to keep them dark and borderless
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						-- More uniform colors for the popup menu. See https://github.com/rebelot/kanagawa.nvim#dark-completion-popup-menu
						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },
					}
				end,
			})
			vim.cmd([[colorscheme kanagawa-wave]])
			local wk = require("which-key")
			wk.add({
				{ "<leader>u", group = "colorscheme" },
				{ "<leader>uw", "<cmd>colorscheme kanagawa-wave<CR>", desc = "kanagawa wave" },
				{ "<leader>ud", "<cmd>colorscheme kanagawa-dragon<CR>", desc = "kanagawa dragon" },
				{ "<leader>ul", "<cmd>colorscheme kanagawa-lotus<CR>", desc = "kanagawa lotus" },
			})
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1001,
		config = function()
			local nightfox = require("nightfox")
			nightfox.setup({
				options = {
					-- Compiled file's destination location
					compile_path = vim.fn.stdpath("cache") .. "/nightfox",
					compile_file_suffix = "_compiled", -- Compiled file suffix
					transparent = false, -- Disable setting background
					terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
					dim_inactive = true, -- Non focused panes set to alternative background
					styles = { -- Style to be applied to different syntax groups
						comments = "italic", -- Value is any valid attr-list value `:help attr-list`
						conditionals = "NONE",
						constants = "NONE",
						functions = "NONE",
						keywords = "italic",
						numbers = "NONE",
						operators = "NONE",
						strings = "NONE",
						types = "NONE",
						variables = "NONE",
					},
					inverse = { -- Inverse highlight for different types
						match_paren = false,
						visual = false,
						search = false,
					},
					modules = { -- List of various plugins and additional options
						barbar = true,
						cmp = true,
						diagnostic = {
							enable = true,
							background = true,
						},
						native_lsp = {
							enable = true,
							background = true,
						},
						gitgutter = true,
						gitsigns = true,
						glyph_palette = true,
						nvimtree = true,
						telescope = true,
						treesitter = true,
						tsrainbow = true,
					},
				},
			})
		end,
	},
	{ "cocopon/iceberg.vim", lazy = false, priority = 1002 },
	{ "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1003 },
	{ "folke/tokyonight.nvim", lazy = false, priority = 1004 },
	{ "sainnhe/everforest", lazy = false, priority = 1005 },
}
