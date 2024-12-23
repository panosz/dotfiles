return {
	{ "godlygeek/tabular" }, -- tabular.vim: Text aligning tools
	{ -- dial -- Extended increment/decrement plugin for Neovim.
		"monaqa/dial.nvim",
		config = function()
			local augend = require("dial.augend")

			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.date.alias["%m/%d"],
					augend.date.alias["%Y-%m-%d"], -- standard date %Y-%m-%d
					augend.date.alias["%d/%m/%Y"], -- standard date %d/%m/%Y
					augend.date.alias["%H:%M:%S"], -- standard time %H:%M:%S
					augend.date.alias["%H:%M"],
					augend.constant.alias.bool, -- boolean value (true <-> false)
					augend.constant.new({
						elements = { "True", "False" },
						word = true,
						cyclic = true,
					}),
				},
			})
			local dm = require("dial.map")
			local wk = require("which-key")
			wk.add({
				{ "<C-a>", dm.inc_normal(), desc = "Increment" },
				{ "<C-x>", dm.dec_normal(), desc = "Decrement" },
			})
			wk.add({
				mode = "v",
				{ "<C-a>", dm.inc_visual(), desc = "Increment" },
				{ "<C-x>", dm.dec_visual(), desc = "Decrement" },
				{ "g<C-a>", dm.inc_gvisual(), desc = "Increment" },
				{ "g<C-x>", dm.dec_gvisual(), desc = "Decrement" },
			})
		end,
	},
	{ "scrooloose/nerdcommenter" }, -- comment functions
	{ "simnalamburt/vim-mundo" }, -- Mundo - visualize undo tree
	{ "tpope/vim-surround" }, -- surround.vim: quoting/parenthesizing made simple
	{ "tpope/vim-repeat" }, -- repeat.vim: Repeat plugin maps using the `.` command
	{ "tpope/vim-abolish" }, -- abolish  - Tim pope's plugin for working with variants of a word
	{ -- autopair pluggin that suppors multiple characters
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true,
				ts_config = { -- treesitter options
					lua = { "string", "source" },
					javascript = { "string", "template_string" },
					java = false,
				},
				disable_filetype = { "TelescopePrompt", "spectre_panel" },
				fast_wrap = {
					map = "<M-e>",
					chars = { "{", "[", "(", '"', "'" },
					pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
					offset = 0, -- Offset from pattern match
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					highlight = "PmenuSel",
					highlight_grey = "LineNr",
				},
			})

			-- automatically add parentheses at autocompleted functions.
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp_status_ok, cmp = pcall(require, "cmp")
			if not cmp_status_ok then
				return
			end
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
		end,
	},
}
