local colors = require("themes").getCurrentTheme()

return {
  TelescopeBorder = {
    fg = colors.darker,
    bg = colors.darker,
  },
  TelescopePromptBorder = {
    fg = colors.cursorline,
    bg = colors.cursorline,
  },
  TelescopePromptNormal = {
    fg = colors.foreground,
    bg = colors.cursorline,
  },
  TelescopePromptPrefix = {
    fg = colors.color1,
    bg = colors.cursorline,
  },
  TelescopeNormal = { bg = colors.darker },
  TelescopePreviewTitle = {
    fg = colors.cursorline,
    bg = colors.color12,
  },
  TelescopePromptTitle = {
    fg = colors.background,
    bg = colors.color9,
  },
  TelescopeResultsTitle = {
    fg = colors.cursorline,
    bg = colors.color10,
  },
  TelescopeSelection = { bg = colors.cursorline, fg = colors.foreground },
  TelescopeResultsDiffAdd = {
    fg = colors.color10,
  },
  TelescopeResultsDiffChange = {
    fg = colors.color11,
  },
  TelescopeResultsDiffDelete = {
    fg = colors.color9,
  },
}
