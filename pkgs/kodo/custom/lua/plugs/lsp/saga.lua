local saga = require 'lspsaga'
saga.setup {
  lightbulb = {
    enable = true,
    enable_in_insert = true,
    sign = false,
    sign_priority = 40,
    virtual_text = true,
  },
  symbol_in_winbar = {
    enable = true,
    separator = "  ",
    ignore_patterns = {},
    hide_keyword = true,
    show_file = true,
    folder_level = 1,
    respect_root = false,
    color_mode = true,
  },
}
