return {
	"vim-test/vim-test",
	dependencies = { "preservim/vimux" },
	vim.keymap.set("n", "<leader>tt", "<cmd>TestNearest<CR>"),
	vim.keymap.set("n", "<leader>tT", "<cmd>TestFile<CR>"),
	vim.keymap.set("n", "<leader>ta", "<cmd>TestSuite<CR>"),
	vim.keymap.set("n", '<leader>tl"', "<cmd>TestLast<CR>"),
	vim.keymap.set("n", "<leader>tg", "<cmd>TestVisit<CR>"),
	vim.cmd("let test#strategy = 'vimux'"),
}
