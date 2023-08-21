local themes = require("themes")
local colors = themes.getCurrentTheme()

return {
  AlphaHeader = { fg = colors.color4, bg = colors.background },
  AlphaLabel = { fg = colors.color7, bg = colors.background },
  AlphaIcon = { fg = colors.color5, bold = true, },
  AlphaKeyPrefix = { fg = colors.color1, bg = themes.darken(colors.color1, colors.background, 0.04) },
  AlphaMessage = { fg = colors.color2, bg = colors.background },
  AlphaFooter = { fg = colors.comment, bg = colors.background },
}
