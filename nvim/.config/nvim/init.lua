require "panos.python"
require "panos.options"
require "panos.spelling"
require "panos.plugins"
require "panos.latex"
require "panos.whichkey"
require "panos.keymaps"
require "panos.hop"
require "panos.colorscheme"
require "panos.cmp"
require "panos.aerial"
require "panos.lsp"
require "panos.treesiter"
require "panos.vimwiki"
require "panos.abbreviations"
require "panos.gitsigns_config"
require "panos.autopairs"
require "panos.greek"
require "panos.nvim-tree"
require "panos.telescope"
require "panos.toggleterm"
require "panos.dial"
require "panos.commands"
require "panos.simple_lualine"
require "panos.tabline"
require "panos.blankline"
-- require "panos.clangd-extensions_config"
-- require "panos.copilot"
require "panos.neodim"
require "panos.alpha"
require "panos.session_manager"
require "panos.project_nvim"
require "panos.dap-python"
require "panos.neoai"
require "panos.chatgpt"

vim.notify = require("notify")

vim.cmd[[
	augroup my-glyph-palette
	  autocmd!
	  autocmd FileType fern call glyph_palette#apply()
	  autocmd FileType nerdtree call glyph_palette#apply()
	  autocmd FileType startify call glyph_palette#apply()
	augroup END
]]

vim.api.nvim_set_keymap('n', '\\', '<cmd>FineCmdline<CR>', {noremap = true})

require('refactoring').setup()
