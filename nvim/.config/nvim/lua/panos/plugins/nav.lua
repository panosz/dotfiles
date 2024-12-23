return {
	{
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
	{
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
	{
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

	{
		"phaazon/hop.nvim", -- Easymotion-like plugin
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},

}
