local utils = require("prism.utils")
local colors = require("prism.themer"):getColors()
return {
  BufflineBufOnActive = { bg = colors.color4, fg = colors.black },
  BufflineBufOnInactive = { fg = colors.color7, bg = utils.darken(colors.color4, colors.cursorline, 0.04) },
  BuffLineBufOnModified = { bg = colors.color4, fg = colors.black },
  BuffLineBufOffModified = { fg = colors.color4, bg = utils.darken(colors.color4, colors.cursorline, 0.04) },
  BuffLineBufOnClose = { bg = colors.color4, fg = colors.black },
  BuffLineBufOffClose = { fg = colors.color9, bg = utils.darken(colors.color9, colors.cursorline, 0.1) },
  BuffLineTree = { bg = colors.darker, fg = colors.white },
  BuffLineEmpty = { bg = colors.background, fg = colors.white },
  BuffLineEmptyColor = { bg = colors.cursorline, fg = colors.white },
  BuffLineButton = { bg = utils.darken(colors.color4, colors.cursorline, 0.12), fg = colors.color4 },
  BuffLineCloseButton = { bg = colors.color9, fg = colors.black },
}
