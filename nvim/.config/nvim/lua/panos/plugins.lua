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
  use 'morhetz/gruvbox'  -- gruvbox: Colorscheme for Vim
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

  use 'vim-airline/vim-airline'  -- vim-airline: Lean & mean status/tabline for vim
  use 'vim-airline/vim-airline-themes'
      vim.g.airline_theme='gruvbox'

  use 'easymotion/vim-easymotion'  -- Easymotion - Vim motion on speed!

  use 'tpope/vim-abolish'  -- abolish  - Tim pope's plugin for working with variants of a word

  use 'Vimjas/vim-python-pep8-indent'  -- A nicer Python indentation style for vim

  use 'vimwiki/vimwiki'  -- vim-wiki

  use 'mattn/calendar-vim'  -- callendar-vim

  use 'tools-life/taskwiki'  -- task-wiki %integrate vim-wiki with taskwarrior

  use 'powerman/vim-plugin-AnsiEsc'  -- AnsiEsc %color text with Ansi escape sequences

  use 'farseer90718/vim-taskwarrior'  -- vim-taskwarrior %a vim interface for taskwarrior

  use 'mhinz/vim-startify'  -- vim-startify %a fancy start screen

  use 'tpope/vim-eunuch'  -- eunuch.vim: Helpers for UNIX shell commands
  use 'tpope/vim-fugitive'  -- Git wrappers
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  -- cmp plugins{{{
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  --}}}

  -- LSP{{{
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  --}}}
  -- snippets{{{
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  --}}}
-- Telescope{{{
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-fzf-native.nvim' -- improve sorting performance
  --}}}
-- Treesitter {{{
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "nvim-treesitter/playground"
  --}}}
--{{{ devicons - add filetype signs to your plugins
  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup()
    end
  }
--}}}
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
