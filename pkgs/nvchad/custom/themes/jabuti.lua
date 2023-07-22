-- Credits to original theme for existing https://github.com/shaunsingh/oxocarbon.nvim
-- this is a modified version of it

local M = {}

M.base_30 = {
  white = "#d9e0ee", -- original
  darker_black = "#252632",
  black = "#292A37",
  black2 = "#252632",
  one_bg = "#292a37",
  one_bg2 = "#2e303e",
  one_bg3 = "#303241",
  grey = "#393a4d",
  grey_fg = "#44465c",
  grey_fg2 = "#9699b7",
  light_grey = "#44465c",
  red = "#ec6a88",
  baby_pink = "#ff7eb6",
  pink = "#be95ff",
  line = "#383747",
  green = "#3FC6DE",
  vibrant_green = "#08bdba",
  nord_blue = "#78a9ff",
  blue = "#78a9ff",
  yellow = "#efb993",
  sun = "#efb993",
  purple = "#936FDC",
  dark_purple = "#936FDC",
  teal = "#B5E8E0",
  orange = "#efb993",
  cyan = "#6be6e6",
  statusline_bg = "#292A37",
  lightbg = "#292A37",
  pmenu_bg = "#6be6e6",
  folder_bg = "#78a9ff",
  lavender = "#c7d1ff",
}

M.base_16 = {
  base00 = "#292A37",
  base01 = "#252632",
  base02 = "#393a4d",
  base03 = "#44465c",
  base04 = "#dde1e6",
  base05 = "#6be6e6",
  base06 = "#ffffff",
  base07 = "#08bdba",
  base08 = "#ec6a88",
  base09 = "#efb993",
  base0A = "#ec6a88",
  base0B = "#3FDAA4",
  base0C = "#ff7eb6",
  base0D = "#3FC6DE",
  base0E = "#936FDC",
  base0F = "#d9e0ee",
}

M.polish_hl = {
  Conditional = {
    fg = M.base_30.nord_blue,
  },

  Tag = {
    fg = M.base_30.red,
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "jabuti")

return M
