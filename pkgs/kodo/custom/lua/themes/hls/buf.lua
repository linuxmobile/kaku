local themes = require("themes")
local colors = themes.getCurrentTheme()
return {
  BufflineBufOnActive = { bg = colors.color4, fg = colors.background },
  BufflineBufOnInactive = { fg = colors.color7, bg = themes.darken(colors.color4, colors.cursorline, 0.04) },
  BuffLineBufOnModified = { bg = colors.color4, fg = colors.background },
  BuffLineBufOffModified = { fg = colors.color4, bg = themes.darken(colors.color4, colors.cursorline, 0.04) },
  BuffLineBufOnClose = { bg = colors.color4, fg = colors.background },
  BuffLineBufOffClose = { fg = colors.color9, bg = themes.darken(colors.color9, colors.cursorline, 0.1) },
  BuffLineTree = { bg = colors.darker, fg = colors.white },
  BuffLineEmpty = { bg = colors.background, fg = colors.white },
  BuffLineEmptyColor = { bg = colors.cursorline, fg = colors.white },
  BuffLineButton = { bg = themes.darken(colors.color4, colors.cursorline, 0.12), fg = colors.color4 },
  BuffLineCloseButton = { bg = colors.color9, fg = colors.background }
}
