return {
	{ "anufrievroman/vim-angry-reviewer" },

	{ "akinsho/toggleterm.nvim" },

	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"folke/todo-comments.nvim", -- highlight and search for todo comments in your code base
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},

	{
		"folke/which-key.nvim", -- displays a popup with possible key bindings of the command you started typing
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},

    {
        "jghauser/papis.nvim",
        dependencies = {
            "kkharji/sqlite.lua",
            "pysan3/pathlib.nvim",
            "nvim-neotest/nvim-nio",
            "MunifTanjim/nui.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()


            require("papis").setup({

            init_filetypes = { "markdown", "norg", "yaml", "typst", "tex" },
              ["debug"] = {

                -- Whether to enable this module.
                enable = false,
              },
      }
      )

      local wk = require("which-key")
      wk.add({
        { "<leader>bb", "<cmd>Papis search<CR>", desc = "[B]ibliography search" },
        { "<leader>bf", "<cmd>Papis at-cursor open-file<CR>", desc = "Open file attached to entry" },
        { "<leader>be", "<cmd>Papis at-cursor edit<CR>", desc = "Edit the info.yaml file" },
        { "<leader>bn", "<cmd>Papis at-cursor open-note<CR>", desc = "Open notes attached to the entry" },
        { "<leader>bn", desc = "Show popup with information", "<cmd>Papis at-cursor show-popup<CR>" },
      })


        end,
    },
}
