return {
	-- My plugins here
	{ "anufrievroman/vim-angry-reviewer" },
	{ "moll/vim-bbye" }, -- Buffer bye - delete buffers without closing windows

	{ "scrooloose/nerdcommenter" }, -- comment functions

	{ "simnalamburt/vim-mundo" }, -- Mundo - visualize undo tree
	{ "tpope/vim-surround" }, -- surround.vim: quoting/parenthesizing made simple

	{ "tpope/vim-repeat" }, -- repeat.vim: Repeat plugin maps using the `.` command

	{ "godlygeek/tabular" }, -- tabular.vim: Text aligning tools

	{ "tpope/vim-abolish" }, -- abolish  - Tim pope's plugin for working with variants of a word

	{ "windwp/nvim-autopairs" }, -- autopair pluggin that suppors multiple characters

	{ "Shatur/neovim-session-manager" }, -- neovim session manager

	{ "akinsho/toggleterm.nvim" },
	{ "monaqa/dial.nvim" }, -- Extended increment/decrement plugin for Neovim.
	{ "xiyaowong/nvim-transparent" },
	{ "ahmedkhalf/project.nvim" }, -- an all in one neovim plugin written in lua that provides superior project management.

	{
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},

	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"folke/todo-comments.nvim", -- highlight and search for todo comments in your code base
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},

	{
		"folke/which-key.nvim", -- displays a popup with possible key bindings of the command you started typing
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	---{{{Debug
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },
	--- add python support
	{ "mfussenegger/nvim-dap-python" },
	--}}}

	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{
		"jghauser/papis.nvim",
		dependencies = {
			"kkharji/sqlite.lua",
			"pysan3/pathlib.nvim",
			"nvim-neotest/nvim-nio",
			"MunifTanjim/nui.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("papis").setup({
				-- Your configuration goes here
			})
		end,
	},
}
