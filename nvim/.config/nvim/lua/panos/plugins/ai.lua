return {
	{
		"Bryley/neoai.nvim",
		config = function()
			require("neoai").setup({
				open_ai = {
					api_key = {
                        get = function()
                            local key = vim.fn.system("pass show openai_key")
                            key = string.gsub(key, "\n", "")
                            return key
                        end,
					},
				},
			}) -- Options go here
		end,
	},
}
