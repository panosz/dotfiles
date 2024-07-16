local hop = require('hop')
local hop_hint = require('hop.hint')
local wk = require("which-key")

local function fchar()
  hop.hint_char1({
    direction = hop_hint.HintDirection.AFTER_CURSOR,
    current_line_only = true
  })
end

local function Fchar()
  hop.hint_char1({
    direction = hop_hint.HintDirection.BEFORE_CURSOR,
    current_line_only = true
  })
end

local function tchar()
  hop.hint_char1({
    direction = hop_hint.HintDirection.AFTER_CURSOR,
    current_line_only = true,
    hint_offset = -1
  })
end

local function Tchar()
  hop.hint_char1({
    direction = hop_hint.HintDirection.BEFORE_CURSOR,
    current_line_only = true,
    hint_offset = -1
  })
end

wk.add({
  { "<Leader><Leader>",  group = "Hop" },
  { "<Leader><Leader>f", fchar,                desc = "find character forward" },
  { "<Leader><Leader>F", Fchar,                desc = "find character backward" },
  { "<Leader><Leader>t", tchar,                desc = "to character forward" },
  { "<Leader><Leader>T", Tchar,                desc = "to character backward" },
  { "<Leader><Leader>w", "<cmd>HopWordAC<cr>", desc = "word forward" },
  { "<Leader><Leader>W", "<cmd>HopWordBC<cr>", desc = "word backward" },
  { "<Leader><Leader>j", "<cmd>HopLineAC<cr>", desc = "line forward" },
  { "<Leader><Leader>k", "<cmd>HopLineBC<cr>", desc = "line backward" },
})
