local status_ok, dial = pcall(require, "dial")
if not status_ok then
  return
end

local searchlist = {
  "number#decimal#int", -- decimal integer including negative (0, 192, -3, etc.)
  "date#[%Y-%m-%d]",    -- standard date %Y-%m-%d
  "date#[%Y/%m/%d]",    -- standard date %Y/%m/%d
  "date#[%H:%M:%S]",    -- standard time %H:%M:%S
  "number#hex",         -- hex number (e.g. 0x3f)
}

dial.config.searchlist.normal = searchlist
dial.config.searchlist.visual = searchlist

