require "config.python"
require "config.options"
require "config.spelling"


-- leader key{{{
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = ","
--}}}

require "config.lazy"
require "config.keymaps"
require "config.abbreviations"
require "config.toggleterm"
require "config.commands"
require "config.dap-python"
require "config.greek"
