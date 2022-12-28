local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  --{{{ colorschemes
  use 'morhetz/gruvbox'  -- gruvbox: Colorscheme for Vim
  use 'EdenEast/nightfox.nvim'  -- nightfox: Colorscheme for Vim

  --}}}
  use 'tpope/vim-unimpaired' -- Vim-Unimpared - useful mappings
  use 'lervag/vimtex'  -- vimtex
  use 'moll/vim-bbye'  -- Buffer bye - delete buffers without closing windows

  use 'scrooloose/nerdcommenter' -- comment functions
    vim.g.NERDSpaceDelims = 1 -- Add spaces after comment delimiters by default
    vim.g.NERDToggleCheckAllLines = 1 -- Enable NERDCommenterToggle to check all selected lines is commented or not

  use 'simnalamburt/vim-mundo'  -- Mundo - visualize undo tree
  use 'tpope/vim-surround'  -- surround.vim: quoting/parenthesizing made simple

  use 'tpope/vim-repeat'  -- repeat.vim: Repeat plugin maps using the `.` command

  use 'godlygeek/tabular'  -- tabular.vim: Text aligning tools

  -- status line{{{
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
--}}}
-- tabline{{{
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
--}}}

  use {
    'phaazon/hop.nvim', -- Easymotion-like plugin
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  use 'tpope/vim-abolish'  -- abolish  - Tim pope's plugin for working with variants of a word

  use 'Vimjas/vim-python-pep8-indent'  -- A nicer Python indentation style for vim

  use 'vimwiki/vimwiki'  -- vim-wiki

  use 'mattn/calendar-vim'  -- callendar-vim

  -- use 'tools-life/taskwiki'  -- task-wiki %integrate vim-wiki with taskwarrior

  use 'powerman/vim-plugin-AnsiEsc'  -- AnsiEsc %color text with Ansi escape sequences

  use 'farseer90718/vim-taskwarrior'  -- vim-taskwarrior %a vim interface for taskwarrior

  use 'mhinz/vim-startify'  -- vim-startify %a fancy start screen

  use 'tpope/vim-eunuch'  -- eunuch.vim: Helpers for UNIX shell commands

  use 'windwp/nvim-autopairs' -- autopair pluggin that suppors multiple characters

-- Git wrappers{{{
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  use 'junegunn/gv.vim' -- A git commit browser.
  use 'tpope/vim-rhubarb' -- If fugitive.vim is the Git, rhubarb.vim is the Hub
--}}}
  -- cmp plugins{{{
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"}) -- git completins
  --}}}
  -- LSP{{{
  use { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
      },
  }
  use { -- For non-lsp sources, such as linters
  "jose-elias-alvarez/null-ls.nvim",
  "jayp0521/mason-null-ls.nvim",
  }

  use "ray-x/lsp_signature.nvim" -- show function signature when you type
  --}}}
  -- snippets{{{
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  --}}}
-- Telescope{{{
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }-- improve sorting performance
  use 'nvim-telescope/telescope-symbols.nvim' -- symbols
  use 'jvgrootveld/telescope-zoxide' -- integration with zoxide
  --}}}
-- Treesitter {{{
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "nvim-treesitter/playground"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "p00f/nvim-ts-rainbow"
  --}}}
--{{{ devicons - add filetype signs to your plugins
  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup()
    end
  }
--}}}
use 'kyazdani42/nvim-tree.lua' -- A File Explorer For Neovim Written In Lua
use "akinsho/toggleterm.nvim"
use "lukas-reineke/indent-blankline.nvim"
use "monaqa/dial.nvim" -- Extended increment/decrement plugin for Neovim.
use  "xiyaowong/nvim-transparent"
use  "lambdalisue/glyph-palette.vim"
use  "stevearc/aerial.nvim"  -- A code outline window for skimming and quick navigation
use {
  "ahmedkhalf/project.nvim", -- an all in one neovim plugin written in lua that provides superior project management.
  config = function()
    require("project_nvim").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' } -- review all changed files for any git rev.

use {"p00f/clangd_extensions.nvim"} -- extensions for c/cpp

-- use{ 'folke/twilight.nvim',
  -- config = function()
  -- require("twilight").setup {
    -- -- your configuration comes here
    -- -- or leave it empty to use the default settings
    -- -- refer to the configuration section below
  -- }
  -- end
-- }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
