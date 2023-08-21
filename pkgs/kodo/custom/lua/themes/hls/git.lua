local colors = require("themes").getCurrentTheme()

return {
  GitSignsAdd = { fg = colors.color4 },    -- diff mode: Added line |diff.txt|
  GitSignsChange = { fg = colors.color5 }, -- diff mode: Changed line |diff.txt|
  GitSignsDelete = { fg = colors.color1 }, -- diff mode: Deleted line |diff.txt|
}
