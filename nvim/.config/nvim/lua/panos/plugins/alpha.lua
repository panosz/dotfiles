return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		alpha.setup(dashboard.config)

		local header_art = require("panos.header_art")

		local function split_string_at_newline(str)
			local result = {}
			for line in string.gmatch(str .. "\n", "(.-)\n") do
				table.insert(result, line)
			end
			return result
		end

		local function get_random_header_art()
			local random_number = math.random(1, #header_art)
			local selected = header_art[random_number]
			return split_string_at_newline(selected)
		end

		-- Set header
		dashboard.section.header.val = get_random_header_art()

		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("<Leader>ff", "  File Explorer"),
			dashboard.button("<Leader>fo", "  Find File"),
			dashboard.button("<Leader>fs", "  Find Word"),
			dashboard.button("l", "  > mason", "<cmd>Mason<cr>"),
			dashboard.button("h", "  > health", "<cmd>checkhealth<cr>"),
			dashboard.button("q", "  > quit", "<cmd>qa!<cr>"),
		}
		alpha.setup(dashboard.opts)
	end,
	event = "VimEnter",
}
