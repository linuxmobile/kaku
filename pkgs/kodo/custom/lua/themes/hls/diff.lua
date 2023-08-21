local colors = require("themes").getCurrentTheme()

return {
  diffAdded = { fg = colors.color4 },
  diffRemoved = { fg = colors.color1 },
  diffChanged = { fg = colors.color5 },
  diffOldFile = { fg = colors.color5 },
  diffNewFile = { fg = colors.color5 },
  diffFile = { fg = colors.color7 },
  diffLine = { fg = colors.color1 },
  diffIndexLine = { fg = colors.color12 },
}
