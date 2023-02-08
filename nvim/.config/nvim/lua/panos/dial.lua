local status_ok, augend = pcall(require, "dial.augend")
if not status_ok then
	return
end

require("dial.config").augends:register_group({
	default = {
		augend.integer.alias.decimal,
		augend.date.alias["%m/%d"],
		augend.date.alias["%Y-%m-%d"], -- standard date %Y-%m-%d
		augend.date.alias["%Y/%m/%d"], -- standard date %Y/%m/%d
		augend.date.alias["%H:%M:%S"], -- standard time %H:%M:%S
		augend.date.alias["%H:%M"],
	},
})
