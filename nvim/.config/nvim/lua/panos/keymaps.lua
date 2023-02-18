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
keymap("n", "<Leader>w", ":w<CR>|", opts) -- Save file


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
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
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
keymap("n", "<Leader>y", "\"+y", opts)
keymap("n", "<Leader>Y", "\"+Y", opts)
keymap("n", "<Leader>d", "\"+d", opts)
keymap("n", "<Leader>p", "\"+p", opts)
keymap("n", "<Leader>P", "\"+P", opts)
keymap("n", "<Leader>p", "\"+p", opts)
keymap("n", "<Leader>P", "\"+P", opts)

keymap("v", "<Leader>y", "\"+y", opts)
keymap("v", "<Leader>Y", "\"+Y", opts)
keymap("v", "<Leader>d", "\"+d", opts)
keymap("v", "<Leader>p", "\"+p", opts)
keymap("v", "<Leader>P", "\"+P", opts)
keymap("v", "<Leader>p", "\"+p", opts)
keymap("v", "<Leader>P", "\"+P", opts)
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
local t_b = require('telescope.builtin')
local t_zoxide = require('telescope').extensions.zoxide
local t_frecency = require('telescope').extensions.frecency.frecency
local t_project = require('telescope').extensions.project.project

vim.keymap.set("n", "<leader>ff", t_b.find_files, opts)
vim.keymap.set("n", "<leader>fb", t_b.buffers, opts)
vim.keymap.set("n", "<leader>fh", t_b.help_tags, opts)
vim.keymap.set("", "<leader>fw", t_b.grep_string, { desc = '[F]ind [W]ord', noremap = true, silent = true })
vim.keymap.set("n", "<leader>fr", t_frecency, { desc = '[F]ind [R]ecent', noremap = true, silent = true })
vim.keymap.set("n", "<leader>fp", t_project, { desc = '[F]ind [P]roject', noremap = true, silent = true })
vim.keymap.set("n", "<leader>g", t_b.git_files, { desc = '[G]it files', noremap = true, silent = true })
vim.keymap.set("n", "<leader>o", t_b.oldfiles, { desc = '[O]ld files', noremap = true, silent = true })
vim.keymap.set("n", "<c-g>", t_b.live_grep, opts)
vim.keymap.set("n", "<leader>cd", t_zoxide.list, opts)
vim.keymap.set('n', '<leader>/', t_b.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer]' , noremap = true, silent = true})
-- }}}

-- dial {{{
keymap("n", "<C-a>", "<Plug>(dial-increment)", {})
keymap("n", "<C-x>", "<Plug>(dial-decrement)", {})
keymap("v", "<C-a>", "<Plug>(dial-increment)", {})
keymap("v", "<C-x>", "<Plug>(dial-decrement)", {})
keymap("v", "g<C-a>", "g<Plug>(dial-increment)", {})
keymap("v", "g<C-x>", "g<Plug>(dial-decrement)", {})
--- }}}

-- hop{{{
keymap('', '<Leader><Leader>w', "<cmd>HopWordAC<cr>", {})
keymap('', '<Leader><Leader>W', "<cmd>HopWordBC<cr>", {})
keymap('', '<Leader><Leader>j', "<cmd>HopLineAC<cr>", {})
keymap('', '<Leader><Leader>k', "<cmd>HopLineBC<cr>", {})
local hop = require('hop')
local hop_hint = require('hop.hint')

local function fchar()
  hop.hint_char1({
    direction = hop_hint.HintDirection.AFTER_CURSOR,
    current_line_only = true
  })
end

local function Fchar()
  hop.hint_char1({
    direction = hop_hint.HintDirection.BEFORE_CURSOR,
    current_line_only = true
  })
end

local function tchar()
  hop.hint_char1({
    direction = hop_hint.HintDirection.AFTER_CURSOR,
    current_line_only = true,
    hint_offset = -1
  })
end

local function Tchar()
  hop.hint_char1({
    direction = hop_hint.HintDirection.BEFORE_CURSOR,
    current_line_only = true,
    hint_offset = -1
  })
end

vim.keymap.set('', '<LocalLeader>f', fchar, {})
vim.keymap.set('', '<LocalLeader>F', Fchar, {})
vim.keymap.set('', '<LocalLeader>t', tchar, {})
vim.keymap.set('', '<LocalLeader>T', Tchar, {})
-- }}}

-- aerial{{{
vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
-- }}}

-- sessions{{{
vim.keymap.set('n', '<leader>ss', '<cmd>SessionManager save_current_session<CR>')
vim.keymap.set('n', '<leader>sl', '<cmd>SessionManager load_session<CR>')
vim.keymap.set('n', '<leader>sL', '<cmd>SessionManager load_last_session<CR>')
-- }}}

-- vim:foldmethod=marker:foldlevel=0
