local themes = require("themes")
local colors = themes.getCurrentTheme()

return {
  DiagnosticError = { fg = colors.color9, bg = themes.darken(colors.color9, colors.background, 0.15) },
  DiagnosticWarn = { fg = colors.color11, bg = themes.darken(colors.color11, colors.background, 0.15) },
  DiagnosticHint = { fg = colors.color6, bg = colors.background },
  DiagnosticInfo = { fg = colors.color4, bg = themes.darken(colors.color4, colors.background, 0.15) },
}
