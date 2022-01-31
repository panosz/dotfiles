-- Shorten function and options{{{
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap
--}}}

-- leader key{{{
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","
--}}}

-- Normal{{{


    keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts) -- open file explorer
    keymap("n", "<Leader>r", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], opts) -- search and replace under cursor
    keymap("n", "<Leader>q", ":Bdelete<CR>", opts) -- close buffer without closing window
	keymap("n","<Leader>w", ":w<CR>|", opts) -- Save file


    keymap("n", "<Leader>t", ":vs |:term<CR> i", opts) -- open terminal in vertical split
    keymap("n", "<Leader>T", ":sp |:term<CR> i", opts) -- open terminal in horizontal split

    keymap("n", "gV", "`[v`]", opts) -- highlight last inserted text

    keymap("n", "<leader>n", ":nohlsearch<CR>", opts) -- turn off search highlight

    keymap("n", "<F5>", ":MundoToggle<CR>", opts) -- Toggle undo tree
	-- Better window navigation{{{
	keymap("n", "<C-h>", "<C-w>h", opts)
	keymap("n", "<C-j>", "<C-w>j", opts)
	keymap("n", "<C-k>", "<C-w>k", opts)
	keymap("n", "<C-l>", "<C-w>l", opts)
	--}}}

-- move vertically by visual line{{{
	keymap("n","j", "gj",opts)
	keymap("n","k", "gk",opts)
    --}}}

-- Resize with arrows{{{
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts) 
--}}}

--}}}

-- Insert {{{
	-- Press jk fast to esc
	keymap("i", "jk", "<ESC>", opts)
--}}}

-- Visual --{{{
-- Move text up and down{{{
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
--}}}
keymap("v", "p", '"_dP', opts) -- paste over selected text again and again
--}}}

-- Visual Block --{{{
-- Move text up and down{{{
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
--}}}
--}}}

	-- copy and paste {{{
	keymap("n","<Leader>y","\"+y", opts)
	keymap("n","<Leader>Y","\"+Y", opts)
	keymap("n","<Leader>d","\"+d", opts)
	keymap("n","<Leader>p","\"+p", opts)
	keymap("n","<Leader>P","\"+P", opts)
	keymap("n","<Leader>p","\"+p", opts)
	keymap("n","<Leader>P","\"+P", opts)

	keymap("v","<Leader>y","\"+y", opts)
	keymap("v","<Leader>Y","\"+Y", opts)
	keymap("v","<Leader>d","\"+d", opts)
	keymap("v","<Leader>p","\"+p", opts)
	keymap("v","<Leader>P","\"+P", opts)
	keymap("v","<Leader>p","\"+p", opts)
	keymap("v","<Leader>P","\"+P", opts)
	--  }}}

-- Terminal --{{{
-- Better terminal navigation --{{{
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
--}}}
keymap("t", "<Esc>", "<C-\\><C-N>", opts) -- easier switch from terminal to normal mode
keymap("t", "<C-v><Esc>", "<Esc>", opts) -- verbatim escape in terminal buffer
--}}}
-- Telescope {{{
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>o", "<cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-g>", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>cd", "<cmd>Telescope zoxide list<cr>", opts)

-- }}}

-- dial {{{
keymap("n", "<C-a>", "<Plug>(dial-increment)", {})
keymap("n", "<C-x>", "<Plug>(dial-decrement)", {})
keymap("v", "<C-a>", "<Plug>(dial-increment)", {})
keymap("v", "<C-x>", "<Plug>(dial-decrement)", {})
keymap("v", "g<C-a>", "<Plug>(dial-increment-additional)", {})
keymap("v", "g<C-x>", "<Plug>(dial-decrement-additional)", {})
--- }}}


-- vim:foldmethod=marker:foldlevel=0
