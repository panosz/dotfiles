return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/playground",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"p00f/nvim-ts-rainbow",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"cpp",
				"python",
				"html",
				"lua",
				"vue",
				"latex",
				"markdown",
				"markdown_inline",
				"vimdoc",
			}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
			sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
			ignore_install = {}, -- List of parsers to ignore installing
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { "org" }, -- list of language that will be disabled
				additional_vim_regex_highlighting = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn", -- set to `false` to disable one of the mappings
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
			indent = { enable = true, disable = { "yaml" } },
			playground = {
				enable = true,
				disable = {},
				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
				persist_queries = false, -- Whether the query persists across vim sessions
				keybindings = {
					toggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<cr>",
					show_help = "?",
				},
			},
			rainbow = {
				enable = true,
				-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
				extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
				max_file_lines = nil, -- Do not enable for files with more than n lines, int
				-- colors = {}, -- table of hex strings
				-- termcolors = {} -- table of colour name strings
			},
			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["am"] = "@function.outer",
						["im"] = "@function.inner",
						["if"] = "@call.inner",
						["af"] = "@call.outer",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["ia"] = "@parameter.inner",
						["aa"] = "@parameter.outer",
						["ii"] = "@conditional.inner",
						["ai"] = "@conditional.outer",
						["il"] = "@loop.inner",
						["al"] = "@loop.outer",
						["at"] = "@comment.outer",
						["l="] = "@assignment.lhs",
						["r="] = "@assignment.rhs",
						["i="] = "@assignment.inner",
						["a="] = "@assignment.outer",

						-- Or you can define your own textobjects like this
						-- ["iF"] = {
						-- python = "(function_definition) @function",
						-- cpp = "(function_definition) @function",
						-- c = "(function_definition) @function",
						-- java = "(method_declaration) @function",
						-- },
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>j"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>k"] = "@parameter.inner",
					},
				},
				lsp_interop = {
					enable = true,
					border = "none",
					peek_definition_code = { -- show textobject surrounding definition as determined using Neovim's built-in LSP in a floating window. Press the shortcut twice to enter the floating window
						["<leader>df"] = "@function.outer",
						["<leader>dF"] = "@class.outer",
					},
				},
			},
		})
	end,
}
