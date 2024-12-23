require "panos.python"
require "panos.options"
require "panos.spelling"


-- leader key{{{
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = ","
--}}}

require "config.lazy"
require "config.keymaps"
require "panos.abbreviations"
require "panos.telescope"
require "panos.toggleterm"
require "panos.commands"
require "panos.dap-python"


 vim.g.NERDSpaceDelims = 1 -- Add spaces after comment delimiters by default
 vim.g.NERDToggleCheckAllLines = 1 -- Enable NERDCommenterToggle to check all selected lines is commented or not

require "panos.greek"


require('refactoring').setup()
