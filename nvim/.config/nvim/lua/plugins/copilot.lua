return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter", -- this is the recommended way to lazy load copilot
		config = function()
			require("panos.copilot")
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup({ event = "LspAttach" })
		end,
	},
}
