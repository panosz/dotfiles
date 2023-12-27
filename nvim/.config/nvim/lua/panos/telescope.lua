local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end


local actions = require "telescope.actions"
local action_state = require("telescope.actions.state")
local themes = require "telescope.themes"

-- Copied from benfrain
--- Insert filename into the current buffer and keeping the insert mode. 
actions.insert_name_i = function(prompt_bufnr)
  local symbol = action_state.get_selected_entry().ordinal
  actions.close(prompt_bufnr)
  vim.schedule(function()
    vim.cmd([[startinsert]])
    vim.api.nvim_put({ symbol }, "", true, true)
  end)
end

-- Copied from benfrain
--- Insert file path and name into the current buffer and keeping the insert mode.
actions.insert_name_and_path_i = function(prompt_bufnr)
  local symbol = action_state.get_selected_entry().value
  actions.close(prompt_bufnr)
  vim.schedule(function()
    vim.cmd([[startinsert]])
    vim.api.nvim_put({ symbol }, "", true, true)
  end)
end


--- Insert relative file path and name into the current buffer and keeping the insert mode.
actions.insert_name_and_relative_path_i = function(prompt_bufnr)
  local symbol = action_state.get_selected_entry().value
  actions.close(prompt_bufnr)
  vim.schedule(function()
    local cwd = vim.fn.expand("%:p:h")
    local filepath= require("plenary.path"):new(symbol)
    filepath:make_relative(cwd)
    vim.cmd([[startinsert]])
    vim.api.nvim_put({ filepath.filename }, "", true, true)
  end)
end

local telescopeConfig = require("telescope.config")

-- Search in hidden files but not in .git folder (recipe copied from https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#file-and-text-search-in-hidden-files-and-directories)
-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.setup {
  defaults = {
    vimgrep_arguments = vimgrep_arguments,

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
        ["<C-Y>"] = actions.insert_name_i,
        ["<C-r>"] = actions.insert_name_and_relative_path_i,
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
        ["<C-Y>"] = actions.insert_name_i,
        ["<C-r>"] = actions.insert_name_and_relative_path_i,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      prompt_prefix = '🔍',
    },

    git_files = themes.get_dropdown(),
    -- oldfiles = themes.get_dropdown(),

    live_grep = {
      additional_args = {
        '--hidden',
      },
    },

    current_buffer_fuzzy_find = themes.get_dropdown({
      winblend = 10,
      previewer = false,
    }),


  },
  extensions = {
    media_files = {
        -- filetypes whitelist
        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        filetypes = {"png", "webp", "jpg", "jpeg", "pdf"},
        find_cmd = "rg" -- find command (defaults to `fd`)
      },
      fzf ={
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      },
      frecency = {
        -- db_root = "home/my_username/path/to/db_root",
        show_scores = false,
        show_unindexed = true,
        ignore_patterns = {"*.git/*", "*/tmp/*"},
        disable_devicons = false,
        db_safe_mode = true,
        -- workspaces = {
          -- ["conf"]    = "/home/my_username/.config",
          -- ["data"]    = "/home/my_username/.local/share",
          -- ["project"] = "/home/my_username/projects",
          -- ["wiki"]    = "/home/my_username/wiki"
        -- }
      },
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}


telescope.load_extension('fzf')
telescope.load_extension('zoxide')
telescope.load_extension('media_files')
telescope.load_extension('project')
telescope.load_extension("frecency")
telescope.load_extension("ui-select")
telescope.load_extension("file_browser")
telescope.load_extension('vimwiki')

-- hacky solution for telescope opening file in insert mode, see https://github.com/nvim-telescope/telescope.nvim/issues/2501#issuecomment-1561838990
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
    end
  end,
})
