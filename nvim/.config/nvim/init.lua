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
require "config.abbreviations"
require "panos.toggleterm"
require "panos.commands"
require "panos.dap-python"
require "panos.greek"


require('refactoring').setup()
