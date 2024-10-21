return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter", -- this is the recommended way to lazy load copilot
		config = function()
			local copilot = require("copilot")
			copilot.setup({
				panel = {
					enabled = false,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>",
					},
				},
				suggestion = {
					enabled = false,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<c-a>",
						accept_word = false,
						accept_line = false,
						next = "<c-l>",
						prev = "<c-h>",
						dismiss = "<C-e>",
					},
				},
				copilot_node_command = "node",
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = true,
					gitrebase = false,
					hgcommit = false,
					vimwiki = false,
					svn = false,
					cvs = false,
					["."] = false,
				}, -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup({ event = "LspAttach" })
		end,
	},
	{ "AndreM222/copilot-lualine" },
}
