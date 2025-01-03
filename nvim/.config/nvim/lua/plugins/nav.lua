return {
	{ -- nvim-tree
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle" },
		keys = { "<leader>e" },
		lazy = true,
		opts = {
			disable_netrw = false,
			hijack_netrw = true,
			open_on_tab = false,
			hijack_cursor = false,
			update_cwd = true,
			respect_buf_cwd = true,
			-- update_to_buf_dir   = {
			-- enable = true,
			-- auto_open = true,
			-- },
			diagnostics = {
				enable = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
				ignore_list = {},
			},
			system_open = {
				cmd = nil,
				args = {},
			},
			filters = {
				dotfiles = false,
				custom = {},
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 500,
			},
			view = {
				width = 30,
				side = "left",
				number = false,
				relativenumber = false,
				signcolumn = "yes",
			},
			trash = {
				cmd = "trash",
				require_confirm = true,
			},
		},
		init = function()
			vim.keymap.set("n", "<leader>e", require("nvim-tree.api").tree.toggle)

			-- Uncomment this to open NvimTree on directories.
			-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
			--   callback = function(data)
			--     local directory = vim.fn.isdirectory(data.file) == 1
			--     if directory then
			--       pcall(require("nvim-tree.api").tree.close)
			--       require("nvim-tree.api").tree.open { path = data.file }
			--     end
			--   end,
			-- })
		end,
	},
	{ -- Aerial
		{
			"stevearc/aerial.nvim", -- A code outline window for skimming and quick navigation
			lazy = true,
			cmd = { "AerialToggle" },
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
				"nvim-web-devicons",
			},
			opts = {},
			init = function()
				local wk = require("which-key")

				wk.add({
					{ "<leader>a", "<cmd>AerialToggle<CR>", desc = "Aerial" },
				})
			end,
		},
	},
	{ -- oil.nvim
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},
	{ -- open links
		"chrishrb/gx.nvim",
		keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
		cmd = { "Browse" },
		init = function()
			vim.g.netrw_nogx = 1 -- disable netrw gx
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true, -- default settings
		submodules = false, -- not needed, submodules are required only for tests
	},

	{ -- hop
		"phaazon/hop.nvim", -- Easymotion-like plugin
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

			local hop = require("hop")
			local hop_hint = require("hop.hint")
			local wk = require("which-key")

			local function fchar()
				hop.hint_char1({
					direction = hop_hint.HintDirection.AFTER_CURSOR,
					current_line_only = true,
				})
			end

			local function Fchar()
				hop.hint_char1({
					direction = hop_hint.HintDirection.BEFORE_CURSOR,
					current_line_only = true,
				})
			end

			local function tchar()
				hop.hint_char1({
					direction = hop_hint.HintDirection.AFTER_CURSOR,
					current_line_only = true,
					hint_offset = -1,
				})
			end

			local function Tchar()
				hop.hint_char1({
					direction = hop_hint.HintDirection.BEFORE_CURSOR,
					current_line_only = true,
					hint_offset = -1,
				})
			end

			wk.add({
				{ "<Leader><Leader>", group = "Hop" },
				{ "<Leader><Leader>f", fchar, desc = "find character forward" },
				{ "<Leader><Leader>F", Fchar, desc = "find character backward" },
				{ "<Leader><Leader>t", tchar, desc = "to character forward" },
				{ "<Leader><Leader>T", Tchar, desc = "to character backward" },
				{ "<Leader><Leader>w", "<cmd>HopWordAC<cr>", desc = "word forward" },
				{ "<Leader><Leader>W", "<cmd>HopWordBC<cr>", desc = "word backward" },
				{ "<Leader><Leader>j", "<cmd>HopLineAC<cr>", desc = "line forward" },
				{ "<Leader><Leader>k", "<cmd>HopLineBC<cr>", desc = "line backward" },
			})
		end,
	},

	{ "junegunn/fzf" },
	{ "junegunn/fzf.vim" },
	{ "tpope/vim-unimpaired" }, -- Vim-Unimpared - useful navigation mappings
}
