return {
	-- My plugins here
	{ "wbthomason/packer.nvim" }, -- Have packer manage itself
	{ "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
	--{{{ colorschemes
	{ "morhetz/gruvbox" }, -- gruvbox: Colorscheme for Vim
	{ "lifepillar/vim-gruvbox8" },
	{ "sainnhe/gruvbox-material" },
	{ "rebelot/kanagawa.nvim" },
	{ "EdenEast/nightfox.nvim" }, -- nightfox: Colorscheme for Vim
	{ "cocopon/iceberg.vim" },
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "sainnhe/sonokai" },
	{ "savq/melange-nvim" },
	{ "aktersnurra/no-clown-fiesta.nvim" },
	{ "arcticicestudio/nord-vim" },
	{ "folke/tokyonight.nvim" },
	{ "ishan9299/nvim-solarized-lua" },
	--}}}
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

	{ "tpope/vim-abolish" }, -- abolish  - Tim pope's plugin for working with variants of a word

	{ "Vimjas/vim-python-pep8-indent" }, -- A nicer Python indentation style for vim

	{
		"vimwiki/vimwiki", -- vim-wiki
		branch = "dev",
	},

	{ "itchyny/calendar.vim" }, -- callendar-vim

	-- use 'tools-life/taskwiki'  -- task-wiki %integrate vim-wiki with taskwarrior

	{ "powerman/vim-plugin-AnsiEsc" }, -- AnsiEsc %color text with Ansi escape sequences

	{ "farseer90718/vim-taskwarrior" }, -- vim-taskwarrior %a vim interface for taskwarrior

	{
		"epwalsh/obsidian.nvim",
		-- tag = "*",  -- recommended, use latest release instead of latest commit
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
		},
	},

	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},

	{ "echasnovski/mini.nvim" },

	{ "tpope/vim-eunuch" }, -- eunuch.vim: Helpers for UNIX shell commands

	{ "windwp/nvim-autopairs" }, -- autopair pluggin that suppors multiple characters

	-- Git stuff{{{
	{ "tpope/vim-fugitive" },
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{ "junegunn/gv.vim" }, -- A git commit browser.
	{ "tpope/vim-rhubarb" }, -- If fugitive.vim is the Git, rhubarb.vim is the Hub
	{
		"wintermute-cell/gitignore.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim", -- optional: for multi-select
		},
	},

	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" }, -- review all changed files for any git rev.

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
	},

	{ "rbong/vim-flog" }, -- a git log viewer

	--}}}
	-- cmp plugins{{{
	{ "hrsh7th/nvim-cmp" }, -- The completion plugin
	{ "hrsh7th/cmp-buffer" }, -- buffer completions
	{ "hrsh7th/cmp-path" }, -- path completions
	{ "hrsh7th/cmp-cmdline" }, -- cmdline completions
	{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "petertriho/cmp-git", dependencies = "nvim-lua/plenary.nvim" }, -- git completins
	--   }}}
	--   LSP{{{
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "j-hui/fidget.nvim" },
	{ "folke/neodev.nvim" }, -- Additional lua configuration, makes nvim stuff amazing
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
	},
	{ -- For non-lsp sources, such as linters
		"nvimtools/none-ls.nvim", -- replacement for "jose-elias-alvarez/null-ls.nvim",
		"jayp0521/mason-null-ls.nvim",
	},

	{ "ray-x/lsp_signature.nvim" }, -- show function signature when you type

	{ "onsails/lspkind-nvim" }, -- vscode-like pictograms for neovim lsp completion items

	--  }}} LSP

	-- {{{ Colilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter", -- this is the recommended way to lazy load copilot
		config = function()
			require("panos.copilot")
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup({ event = "LspAttach" })
		end,
	},
	--}}}

	-- {"zbirenbaum/neodim"}, -- dim the highlights of unused elements

	-- snippets{{{
	{ "L3MON4D3/LuaSnip" }, --snippet engine
	{ "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use
	--}}}

	{ "junegunn/fzf" },
	{ "junegunn/fzf.vim" },

	-- Telescope{{{
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-media-files.nvim" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{ "nvim-telescope/telescope-symbols.nvim" }, -- symbols
	{ "jvgrootveld/telescope-zoxide" }, -- integration with zoxide
	{ "nvim-telescope/telescope-project.nvim" }, -- switch between projects
	{
		"nvim-telescope/telescope-frecency.nvim", -- intelligent prioritization when selecting files from your editing history.
		dependencies = { "kkharji/sqlite.lua" },
	},
	{ "nvim-telescope/telescope-ui-select.nvim" }, -- It sets vim.ui.select to telescope
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "ElPiloto/telescope-vimwiki.nvim" },
	---}}}

	{ "Shatur/neovim-session-manager" }, -- neovim session manager

	-- Treesitter {{{
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{ "nvim-treesitter/playground" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ "p00f/nvim-ts-rainbow" },
	--}}}
	--{{{ devicons - add filetype signs to your plugins
	{
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},
	--}}}
	{ "kyazdani42/nvim-tree.lua" }, -- A File Explorer For Neovim Written In Lua
	{ "akinsho/toggleterm.nvim" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "monaqa/dial.nvim" }, -- Extended increment/decrement plugin for Neovim.
	{ "xiyaowong/nvim-transparent" },
	{ "lambdalisue/glyph-palette.vim" },
	{ "stevearc/aerial.nvim" }, -- A code outline window for skimming and quick navigation
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
		"VonHeikemen/fine-cmdline.nvim",
		dependencies = {
			{ "MunifTanjim/nui.nvim" },
		},
	},

	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{
		dir = "~/Documents/programming/papis_nvim/papis.nvim",
		dependencies = {
			"kkharji/sqlite.lua",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("papis").setup({
				-- Your configuration goes here
			})
		end,
	},
-- Lua
{
  "folke/zen-mode.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}

}
