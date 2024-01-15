-- Shorten function and options{{{
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap.set
--}}}

-- leader key{{{
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","
--}}}

-- keymap to enter the tail of the current file name to the command line

keymap("c", "<C-r><C-f>", "<C-r>=expand('%:t')<CR>", { noremap = true })

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
keymap("n", "<Leader>y", '"+y', opts)
keymap("n", "<Leader>Y", '"+Y', opts)
keymap("n", "<Leader>d", '"+d', opts)
keymap("n", "<Leader>p", '"+p', opts)
keymap("n", "<Leader>P", '"+P', opts)
keymap("n", "<Leader>p", '"+p', opts)
keymap("n", "<Leader>P", '"+P', opts)

keymap("v", "<Leader>y", '"+y', opts)
keymap("v", "<Leader>Y", '"+Y', opts)
keymap("v", "<Leader>d", '"+d', opts)
keymap("v", "<Leader>p", '"+p', opts)
keymap("v", "<Leader>P", '"+P', opts)
keymap("v", "<Leader>p", '"+p', opts)
keymap("v", "<Leader>P", '"+P', opts)
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
local t_b = require("telescope.builtin")
local t_zoxide = require("telescope").extensions.zoxide
local t_frecency = require("telescope").extensions.frecency.frecency
local t_project = require("telescope").extensions.project.project

local wk = require("which-key")
wk.register({
	["<leader>"] = {
		["f"] = {
			name = "+[F]ind",
			["f"] = { t_b.find_files, "Find File" },
			["b"] = { t_b.buffers, "Find Buffer" },
			["h"] = { t_b.help_tags, "Find Help" },
			["w"] = { t_b.grep_string, "Find Word" },
			["r"] = { t_frecency, "Find Recent" },
			["p"] = { t_project, "Find Project" },
			["d"] = { t_zoxide.list, "Find Directory" },
			["g"] = { t_b.git_files, "Find file in Git repo" },
			["o"] = { t_b.oldfiles, "Find old file" },
			["s"] = { t_b.live_grep, "Find string in files" },
			["/"] = { t_b.current_buffer_fuzzy_find, "Fuzzily search in current buffer" },
		},
	},
})
-- }}}

--vimwiki{{{
wk.register({
	["<leader>"] = {
		["v"] = {
			name = "+[V]imwiki",
			["n"] = { require("telescope").extensions.vimwiki.vimwiki, "find Note" },
			["s"] = { require("telescope").extensions.vimwiki.live_grep, "Search in notes" },
            ["l"] = {"<cmd>Telescope vw link<CR>", "insert Link"},
            ["b"] = {"<cmd>VimwikiBacklinks<CR>", "Back links"},
		},
	},
})
---}}}

-- aerial{{{
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
-- }}}

-- sessions{{{
wk.register({
	["<leader>"] = {
		["s"] = {
			name = "+[S]ession",
			["s"] = { "<cmd>SessionManager save_current_session<CR>", "Save current session" },
			["l"] = { "<cmd>SessionManager load_session<CR>", "Load session" },
			["L"] = { "<cmd>SessionManager load_last_session<CR>", "Load last session" },
		},
	},
})
-- }}}
--
-- Git{{{
wk.register({
	["<leader>"] = {
		["g"] = {
			name = "+[G]it",
			["g"] = { "<cmd>Git<CR>", "Git window" },
			["w"] = { "<cmd>Gwrite<CR>", "write and stage" },
			["r"] = { "<cmd>Gread<CR>", "checkout to buffer" },
		},
	},
})
-- }}}
-- chat-gpt{{{
wk.register({
	["<LocalLeader>"] = {
		["c"] = {
			name = "+[C]hatGPT",
			c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
			e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
			g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
			t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
			k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
			d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
			a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
			o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
			s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
			f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
			x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
			r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
			l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
		},
	},
})

-- }}}

-- vim:foldmethod=marker:foldlevel=0
