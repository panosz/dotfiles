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

wk.register{
  ["<Leader><Leader>"] = {
    name = "Hop",
    f = { fchar, "find character forward" },
    F = { Fchar, "find character backward" },
    t = { tchar, "to character forward" },
    T = { Tchar, "to character backward" },
    w = { "<cmd>HopWordAC<cr>", "word forward" },
    W = { "<cmd>HopWordBC<cr>", "word backward" },
    j = { "<cmd>HopLineAC<cr>", "line forward" },
    k = { "<cmd>HopLineBC<cr>", "line backward" },
  }
}
