return {
	{  -- an all in one neovim plugin written in lua that provides superior project management.
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				-- Manual mode doesn't automatically change your root directory, so you have
				-- the option to manually do so using `:ProjectRoot` command.
				manual_mode = false,

				-- Methods of detecting the root directory. **"lsp"** uses the native neovim
				-- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
				-- order matters: if one is not detected, the other is used as fallback. You
				-- can also delete or rearangne the detection methods.
				detection_methods = { "pattern", "lsp" },

				-- All the patterns used to detect root dir, when **"pattern"** is in
				-- detection_methods
				patterns = { "^.config", ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

				-- Table of lsp clients to ignore by name
				-- eg: { "efm", ... }
				ignore_lsp = { "null-ls" },

				-- Don't calculate root dir on specific directories
				-- Ex: { "~/.cargo/*", ... }
				exclude_dirs = {},

				-- Show hidden files in telescope
				show_hidden = false,

				-- When set to false, you will get a message when project.nvim changes your
				-- directory.
				silent_chdir = false,

				-- What scope to change the directory, valid options are
				-- * global (default)
				-- * tab
				-- * win
				scope_chdir = "global",

				-- Path where project.nvim will store the project history for use in
				-- telescope
				datapath = vim.fn.stdpath("data"),
			})
		end,
	},

	{ -- session

		"Shatur/neovim-session-manager",
		config = function()
			local Path = require("plenary.path")

			require("session_manager").setup({
				sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"), -- The directory where the session files will be saved.
				path_replacer = "__", -- The character to which the path separator will be replaced for session files.
				colon_replacer = "++", -- The character to which the colon symbol will be replaced for session files.
				autoload_mode = require("session_manager.config").AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
				autosave_last_session = false, -- Automatically save last session on exit and on session switch.
				autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
				autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
				autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
					"gitcommit",
					"gitrebase",
				},
				autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
				autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
				max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
			})
		end,
	}, -- neovim session manager
}
