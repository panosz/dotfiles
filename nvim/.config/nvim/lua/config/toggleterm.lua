local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = false,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

vim.api.nvim_set_keymap("n", "<leader>\\", ":ToggleTerm dir=%:p:h<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<leader>\\", [[<C-\><C-n>:ToggleTerm<CR>]], { noremap = true, silent = true })

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for all terminals use term://* instead
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true })

function _NODE_TOGGLE()
  node:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _NCDU_TOGGLE()
  ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
  htop:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })

function _PYTHON_TOGGLE()
  python:toggle()
end

local function _make_ipython_term_for_file(file, dir)
  local cmd = "ipython -i " .. file

  local ipython = Terminal:new({
    size = 100,
    cmd = cmd,
    dir = dir,
    direction = "float",
    -- function to run on opening the terminal
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
      vim.cmd("startinsert!")
    end,
  })
  return ipython
end

local _ipython_terms = {}

local function make_run_in_ipython_mapping()
  local file = vim.fn.expand("<afile>:p")
  local dir = vim.fn.expand("<afile>:p:h")

  local function run_in_ipython()
    local ipython = _ipython_terms[file]
    if ipython == nil then
      ipython = _make_ipython_term_for_file(file, dir)
      _ipython_terms[file] = ipython
    end

    ipython:toggle()
  end

  vim.schedule(function()
    vim.keymap.set("n", "<LocalLeader>p", run_in_ipython, { noremap = true, silent = true, buffer = true })
  end)
end

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*py",
  callback = make_run_in_ipython_mapping,
})
