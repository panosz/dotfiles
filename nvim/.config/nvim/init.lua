require "panos.python"
require "panos.options"
require "panos.spelling"


-- leader key{{{
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = ","
--}}}

require "panos.lazy"

require "panos.latex"
require "panos.whichkey"
require "panos.keymaps"
require "panos.hop"
 require "panos.colorscheme"
require "panos.cmp"
require "panos.aerial"
require "panos.lsp"
require "panos.treesiter"
require "panos.abbreviations"
require "panos.gitsigns_config"
require "panos.autopairs"
require "panos.nvim-tree"
require "panos.telescope"
require "panos.toggleterm"
require "panos.dial"
require "panos.commands"
require "panos.simple_lualine"
require "panos.tabline"
require "panos.blankline"
require "panos.neodim"
require "panos.alpha"
require "panos.session_manager"
require "panos.project_nvim"
require "panos.dap-python"
require "panos.neoai"
require "panos.chatgpt"


 vim.g.NERDSpaceDelims = 1 -- Add spaces after comment delimiters by default
 vim.g.NERDToggleCheckAllLines = 1 -- Enable NERDCommenterToggle to check all selected lines is commented or not

vim.notify = require("notify")
require "panos.greek"

vim.cmd[[
	augroup my-glyph-palette
	  autocmd!
	  autocmd FileType fern call glyph_palette#apply()
	  autocmd FileType nerdtree call glyph_palette#apply()
	  autocmd FileType startify call glyph_palette#apply()
	augroup END
]]


require('refactoring').setup()
