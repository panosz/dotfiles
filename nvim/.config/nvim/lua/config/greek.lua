-- make it easy to use vim when typing greek
--
-- these options cannot be set with the dictionary iteration idiom used in options.lua
-- this is because setting the `keymap` option resets `iminsert`. I am now sure how lua iterates dictionaries, but it is probably done either randomly or alphabetically. In either case the dictionary iteration idiom does not guarantee that `iminsert` will be set **after** `keymap`, as it should.

vim.opt.keymap="greek_utf-8"
vim.opt.iminsert=0
vim.opt.imsearch=-1

