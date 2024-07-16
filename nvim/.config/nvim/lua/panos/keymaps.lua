-- Shorten function and options{{{
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap.set
--}}}

-- keymap to enter the tail of the current file name to the command line

keymap("c", "<C-r><C-f>", "<C-r>=expand('%:t')<CR>", { noremap = true })

-- Normal{{{
keymap("n", "<Leader>r", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { noremap = true, silent = false }) -- search and replace under cursor
keymap("n", "<Leader>q", ":Bdelete<CR>", opts) -- close buffer without closing window
keymap("n", "<Leader>w", ":w<CR>|", opts) -- Save file

-- keymap("n", "<Leader>t", ":vs |:term<CR> i", opts) -- open terminal in vertical split
-- keymap("n", "<Leader>T", ":sp |:term<CR> i", opts) -- open terminal in horizontal split

keymap("n", "gV", "`[v`]", opts) -- highlight last inserted text

keymap("n", "<leader>n", ":nohlsearch<CR>", opts) -- turn off search highlight

keymap("n", "<F5>", ":MundoToggle<CR>", opts) -- Toggle undo tree
-- Better window navigation{{{
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)
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
wk.add({
	{ "<leader>f", group = "[F]ind" },
	{ "<leader>ff", t_b.find_files, desc = "Find File" },
	{ "<leader>fb", t_b.buffers, desc = "Find Buffer" },
	{ "<leader>fh", t_b.help_tags, desc = "Find Help" },
	{ "<leader>fw", t_b.grep_string, desc = "Find Word" },
	{ "<leader>fr", t_frecency, desc = "Find Recent" },
	{ "<leader>fp", t_project, desc = "Find Project" },
	{ "<leader>fd", t_zoxide.list, desc = "Find Directory" },
	{ "<leader>fg", t_b.git_files, desc = "Find file in Git repo" },
	{ "<leader>fo", t_b.oldfiles, desc = "Find old file" },
	{ "<leader>fs", t_b.live_grep, desc = "Find string in files" },
	{ "<leader>f/", t_b.current_buffer_fuzzy_find, desc = "Fuzzily search in current buffer" },
})
-- }}}

---
-- obsidian{{{

wk.add({
	{ "<leader>o", group = "[O]bsidian" },
	{ "<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc = "[B]acklinks" },
	{ "<leader>od", "<cmd>ObsidianDailies<CR>", desc = "[D]aily notes" },
	{ "<leader>on", "<cmd>ObsidianNew<CR>", desc = "[N]ew note" },
	{ "<leader>oo", "<cmd>ObsidianOpen<CR>", desc = "[O]pen note in obsidian" },
	{ "<leader>op", "<cmd>ObsidianPasteImg<CR>", desc = "[P]aste image" },
	{ "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "[S]earch in notes" },
	{ "<leader>ot", "<cmd>ObsidianTags<CR>", desc = "Search [T]ags" },
	{
		mode = "v",
		{ "<leader>ol", group = "[L]ink" },
		{
			"<leader>oll",
			":ObsidianLink ",
			desc = "[L]ink selection to existing note",
			mode = "v",
			silent = false,
		},
		{
			"<leader>oln",
			":ObsidianLinkNew ",
			desc = "Link selection to [N]ew note",
			mode = "v",
			silent = false,
		},
	},
})
-- }}}

-- sessions{{{
wk.add(
  {
    { "<leader>s", group = "[S]ession" },
    { "<leader>sL", "<cmd>SessionManager load_last_session<CR>", desc = "Load last session" },
    { "<leader>sl", "<cmd>SessionManager load_session<CR>", desc = "Load session" },
    { "<leader>ss", "<cmd>SessionManager save_current_session<CR>", desc = "Save current session" },
  }
)
-- }}}
--
-- Git{{{
wk.add({
    { "<leader>g", group = "[G]it" },
    { "<leader>gg", "<cmd>Neogit<CR>", desc = "Git window" },
    { "<leader>gr", "<cmd>Gread<CR>", desc = "checkout to buffer" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "git [S]tatus" },
    { "<leader>gw", "<cmd>Gwrite<CR>", desc = "write and stage" },
  })
-- }}}
-- chat-gpt{{{
wk.add({
    { "<LocalLeader>c", group = "[C]hatGPT" },
    { "<LocalLeader>cc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
    {
      mode = { "n", "v" },
      { "<LocalLeader>ca", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
      { "<LocalLeader>cd", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
      { "<LocalLeader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
      { "<LocalLeader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
      { "<LocalLeader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
      { "<LocalLeader>ck", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
      { "<LocalLeader>cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
      { "<LocalLeader>co", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
      { "<LocalLeader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
      { "<LocalLeader>cs", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
      { "<LocalLeader>ct", "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
      { "<LocalLeader>cx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
    },
  })

-- }}}

-- vim:foldmethod=marker:foldlevel=0
