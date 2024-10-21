return {
	"mfussenegger/nvim-lint",
	dependencies = { "j-hui/fidget.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
			cpp = { "cpplint" },
			c = { "cpplint" },
			cmake = { "cmakelint" },
		}
		-- Set pylint to work in virtualenv, see https://gist.github.com/Norbiox/652befc91ca0f90014aec34eccee27b2?permalink_comment_id=5230129#gistcomment-5230129
		lint.linters.pylint.cmd = "python"
		lint.linters.pylint.args = { "-m", "pylint", "-f", "json" }
		lint.linters.pylint.args = {
			"-m",
			"pylint",
			"-f",
			"json",
			"--from-stdin",
			function()
				return vim.api.nvim_buf_get_name(0)
			end,
		}
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
		vim.diagnostic.config({
			virtual_text = {
				source = true,
			},
			float = {
				source = true,
			},
		})
		vim.keymap.set("n", "<leader>lL", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
