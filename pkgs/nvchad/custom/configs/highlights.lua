-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Visual = {
    bg = "one_bg",
  },
  Comment = {
    italic = true,
  },
  NvDashAscii = {
    bg = "none",
    fg = "blue",
  },
  NvDashButtons = {
    fg = "grey_fg",
    bg = "none",
  },
  ColorColumn = {
    bg = "NONE",
  },
  NvimTreeRootFolder = {
    fg = "darker_black",
    bg = "darker_black",
  },
  TBTabTitle = {
    bg = "darker_black",
  },
}

return M
