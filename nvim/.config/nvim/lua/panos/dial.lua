local status_ok, augend = pcall(require, "dial.augend")
if not status_ok then
	return
end

require("dial.config").augends:register_group({
	default = {
		augend.integer.alias.decimal,
		augend.date.alias["%m/%d"],
		augend.date.alias["%Y-%m-%d"], -- standard date %Y-%m-%d
		augend.date.alias["%d/%m/%Y"], -- standard date %d/%m/%Y
		augend.date.alias["%H:%M:%S"], -- standard time %H:%M:%S
		augend.date.alias["%H:%M"],
        augend.constant.alias.bool, -- boolean value (true <-> false)
        augend.constant.new {
              elements = { "True", "False" },
              word = true,
              cyclic = true,
            },
  },
})
local dm = require("dial.map")
local wk = require("which-key")
wk.add(
  {
    {"<C-a>" , dm.inc_normal(), desc = "Increment"},
    {"<C-x>" , dm.dec_normal(), desc = "Decrement"},
  }
)
wk.add(
  {
    mode = "v",
    {"<C-a>" , dm.inc_visual(), desc = "Increment" },
    {"<C-x>" , dm.dec_visual(), desc = "Decrement" },
    {"g<C-a>" , dm.inc_gvisual(), desc = "Increment" },
    {"g<C-x>" , dm.dec_gvisual(), desc = "Decrement" },
  }
)
