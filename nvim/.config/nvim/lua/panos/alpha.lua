require("alpha").setup(require("alpha.themes.dashboard").config)

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local alphaterm = require("alpha.term")

local header_art = require('panos.header_art')

local function split_string_at_newline(str)
  local result = {};
  for line in string.gmatch(str .. "\n", "(.-)\n") do
      table.insert(result, line);
  end
  return result;
end

local function get_random_header_art()
  local random_number = math.random(1, #header_art)
  local selected = header_art[random_number]
  return split_string_at_newline(selected)
end


-- Set header
dashboard.section.header.val = get_random_header_art()
-- Set menu
-- dashboard.section.buttons.val = {
	-- dashboard.button("<spc>ft", "  > nnn", "<cmd>lua _nnn_toggle()<cr>"),
	-- dashboard.button("<spc>o", "  > open file", "<cmd>Telescope find_files<cr>"),
	-- dashboard.button("p", "  > projects", "<cmd>Telescope project<cr>"),
	-- dashboard.button("l", "  > mason", "<cmd>Mason<cr>"),
	-- dashboard.button("h", "  > health", "<cmd>checkhealth<cr>"),
	-- dashboard.button("s", "  > settings", "<cmd>e $MYVIMRC | :cd %:p:h<cr>"),
	-- dashboard.button("q", "  > quit", "<cmd>qa!<cr>"),
-- }

-- Send config to alpha
alpha.setup(dashboard.opts)
