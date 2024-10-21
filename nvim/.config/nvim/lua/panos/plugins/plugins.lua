return {
	-- My plugins here
	{ "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
	{ "tpope/vim-unimpaired" }, -- Vim-Unimpared - useful mappings
	{ "lervag/vimtex" }, -- vimtex
	{ "anufrievroman/vim-angry-reviewer" },
	{ "moll/vim-bbye" }, -- Buffer bye - delete buffers without closing windows

	{ "scrooloose/nerdcommenter" }, -- comment functions

	{ "simnalamburt/vim-mundo" }, -- Mundo - visualize undo tree
	{ "tpope/vim-surround" }, -- surround.vim: quoting/parenthesizing made simple

	{ "tpope/vim-repeat" }, -- repeat.vim: Repeat plugin maps using the `.` command

	{ "godlygeek/tabular" }, -- tabular.vim: Text aligning tools

	-- status line{{{
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
	},
	--}}}
	-- tabline{{{
	{
		"romgrk/barbar.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	--}}}

	{
		"phaazon/hop.nvim", -- Easymotion-like plugin
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},

	{ "tpope/vim-eunuch" }, -- abolish  - Tim pope's plugin for working with variants of a word

	{ "Vimjas/vim-python-pep8-indent" }, -- A nicer Python indentation style for vim

	-- {
	-- "vimwiki/vimwiki", -- vim-wiki
	-- branch = "dev",
	-- },

	{ "itchyny/calendar.vim" }, -- callendar-vim

	-- use 'tools-life/taskwiki'  -- task-wiki %integrate vim-wiki with taskwarrior

	{ "powerman/vim-plugin-AnsiEsc" }, -- AnsiEsc %color text with Ansi escape sequences

	{ "farseer90718/vim-taskwarrior" }, -- vim-taskwarrior %a vim interface for taskwarrior

	{ "tpope/vim-abolish" }, -- eunuch.vim: Helpers for UNIX shell commands

	{ "windwp/nvim-autopairs" }, -- autopair pluggin that suppors multiple characters

	-- snippets{{{
	{ "L3MON4D3/LuaSnip" }, --snippet engine
	{ "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use
	--}}}

	{ "junegunn/fzf" },
	{ "junegunn/fzf.vim" },

	{ "Shatur/neovim-session-manager" }, -- neovim session manager

	--{{{ devicons - add filetype signs to your plugins
	{
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},
	--}}}
	{ "akinsho/toggleterm.nvim" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "monaqa/dial.nvim" }, -- Extended increment/decrement plugin for Neovim.
	{ "xiyaowong/nvim-transparent" },
	{ "lambdalisue/glyph-palette.vim" },
	{ "ahmedkhalf/project.nvim" }, -- an all in one neovim plugin written in lua that provides superior project management.

	--   { "p00f/clangd_extensions.nvim" }, -- extensions for c/cpp
	--
	--
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

	{ "frabjous/knap" }, -- auto-refreshing latex

	{ "stevearc/dressing.nvim" }, -- A plugin for applying a consistent style to your Neovim UI

	-- ChatGPT
	--
	--
	{ "MunifTanjim/nui.nvim" },
	{
		"Bryley/neoai.nvim",
	},

	{
		"jackMort/ChatGPT.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},

	{ "rcarriga/nvim-notify" },

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
