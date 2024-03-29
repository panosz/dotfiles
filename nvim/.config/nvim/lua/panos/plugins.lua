local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	--{{{ colorschemes
	use("morhetz/gruvbox") -- gruvbox: Colorscheme for Vim
	use("lifepillar/vim-gruvbox8")
	use("sainnhe/gruvbox-material")
	use("rebelot/kanagawa.nvim")
	use("EdenEast/nightfox.nvim") -- nightfox: Colorscheme for Vim
	use("cocopon/iceberg.vim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("sainnhe/sonokai")
	use("savq/melange-nvim")
	use("aktersnurra/no-clown-fiesta.nvim")
	use("arcticicestudio/nord-vim")
	use("folke/tokyonight.nvim")
	use("ishan9299/nvim-solarized-lua")
	--}}}
	use("tpope/vim-unimpaired") -- Vim-Unimpared - useful mappings
	use("lervag/vimtex") -- vimtex
	use("anufrievroman/vim-angry-reviewer")
	use("moll/vim-bbye") -- Buffer bye - delete buffers without closing windows

	use("scrooloose/nerdcommenter") -- comment functions
	vim.g.NERDSpaceDelims = 1 -- Add spaces after comment delimiters by default
	vim.g.NERDToggleCheckAllLines = 1 -- Enable NERDCommenterToggle to check all selected lines is commented or not

	use("simnalamburt/vim-mundo") -- Mundo - visualize undo tree
	use("tpope/vim-surround") -- surround.vim: quoting/parenthesizing made simple

	use("tpope/vim-repeat") -- repeat.vim: Repeat plugin maps using the `.` command

	use("godlygeek/tabular") -- tabular.vim: Text aligning tools

	-- status line{{{
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	--}}}
	-- tabline{{{
	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	--}}}

	use({
		"phaazon/hop.nvim", -- Easymotion-like plugin
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	use("tpope/vim-abolish") -- abolish  - Tim pope's plugin for working with variants of a word

	use("Vimjas/vim-python-pep8-indent") -- A nicer Python indentation style for vim

	use({
		"vimwiki/vimwiki", -- vim-wiki
		branch = "dev",
	})

	use("itchyny/calendar.vim") -- callendar-vim

	-- use 'tools-life/taskwiki'  -- task-wiki %integrate vim-wiki with taskwarrior

	use("powerman/vim-plugin-AnsiEsc") -- AnsiEsc %color text with Ansi escape sequences

	use("farseer90718/vim-taskwarrior") -- vim-taskwarrior %a vim interface for taskwarrior

    use({
      "epwalsh/obsidian.nvim",
      -- tag = "*",  -- recommended, use latest release instead of latest commit
      requires = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
      }
    })

	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	})

	use("echasnovski/mini.nvim")

	use("tpope/vim-eunuch") -- eunuch.vim: Helpers for UNIX shell commands

	use("windwp/nvim-autopairs") -- autopair pluggin that suppors multiple characters

	-- Git stuff{{{
	use("tpope/vim-fugitive")
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use("junegunn/gv.vim") -- A git commit browser.
	use("tpope/vim-rhubarb") -- If fugitive.vim is the Git, rhubarb.vim is the Hub
    use({"wintermute-cell/gitignore.nvim",
       requires = {
          "nvim-telescope/telescope.nvim" -- optional: for multi-select
       }
    })

	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }) -- review all changed files for any git rev.

    use({"NeogitOrg/neogit",
        config = function()
            require("neogit").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
        }
    )

    use "rbong/vim-flog" -- a git log viewer

	--}}}
	-- cmp plugins{{{
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use({ "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" }) -- git completins
	--}}}
	-- LSP{{{
	use({ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
	})
	use({ -- For non-lsp sources, such as linters
		"nvimtools/none-ls.nvim", -- replacement for "jose-elias-alvarez/null-ls.nvim",
		"jayp0521/mason-null-ls.nvim",
	})

	use("ray-x/lsp_signature.nvim") -- show function signature when you type

	use("onsails/lspkind-nvim") -- vscode-like pictograms for neovim lsp completion items

	--}}} LSP

	-- {{{ Colilot
	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter", -- this is the recommended way to lazy load copilot
		config = function()
          require("panos.copilot")
		end,
	})
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup({event='LspAttach'})
		end,
	})
	--}}}

	-- use("zbirenbaum/neodim") -- dim the highlights of unused elements

	-- snippets{{{
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	--}}}
	-- Telescope{{{
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- improve sorting performance
	use("nvim-telescope/telescope-symbols.nvim") -- symbols
	use("jvgrootveld/telescope-zoxide") -- integration with zoxide
	use("nvim-telescope/telescope-project.nvim") -- switch between projects
	use({
		"nvim-telescope/telescope-frecency.nvim", -- intelligent prioritization when selecting files from your editing history.
		requires = { "kkharji/sqlite.lua" },
	})
	use({ "nvim-telescope/telescope-ui-select.nvim" }) -- It sets vim.ui.select to telescope
	use("nvim-telescope/telescope-file-browser.nvim")
    use("ElPiloto/telescope-vimwiki.nvim")
	---}}}

	use("Shatur/neovim-session-manager") -- neovim session manager

	-- Treesitter {{{
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/playground")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("p00f/nvim-ts-rainbow")
	--}}}
	--{{{ devicons - add filetype signs to your plugins
	use({
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	})
	--}}}
	use("kyazdani42/nvim-tree.lua") -- A File Explorer For Neovim Written In Lua
	use("akinsho/toggleterm.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("monaqa/dial.nvim") -- Extended increment/decrement plugin for Neovim.
	use("xiyaowong/nvim-transparent")
	use("lambdalisue/glyph-palette.vim")
	use("stevearc/aerial.nvim") -- A code outline window for skimming and quick navigation
	use({
		"ahmedkhalf/project.nvim", -- an all in one neovim plugin written in lua that provides superior project management.
	})

	use({ "p00f/clangd_extensions.nvim" }) -- extensions for c/cpp


	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({
		"folke/todo-comments.nvim", -- highlight and search for todo comments in your code base
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
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
	})
	---{{{Debug
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })
	--- add python support
	use({ "mfussenegger/nvim-dap-python" })
	--}}}

	use({ "frabjous/knap" }) -- auto-refreshing latex

	use({ "junegunn/fzf" })
	use({ "junegunn/fzf.vim" })

	use("stevearc/dressing.nvim") -- A plugin for applying a consistent style to your Neovim UI

	-- ChatGPT
	--
	--
	use({
		"Bryley/neoai.nvim",
		require = { "MunifTanjim/nui.nvim" },
	})

	use({
		"jackMort/ChatGPT.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})

    use 'rcarriga/nvim-notify'
    use {
      'VonHeikemen/fine-cmdline.nvim',
      requires = {
        {'MunifTanjim/nui.nvim'}
      }
    }

  use {
      "ThePrimeagen/refactoring.nvim",
      requires = {
          {"nvim-lua/plenary.nvim"},
          {"nvim-treesitter/nvim-treesitter"}
      }
  }
  use({
    "~/Documents/programming/papis_nvim/papis.nvim",
    branch ="quick_and_dirty_formatting",
    after = { "telescope.nvim", "nvim-cmp" },
    requires = {
      "kkharji/sqlite.lua",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("papis").setup(
      -- Your configuration goes here
      )
    end,
  })
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
