---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.configs.highlights"

M.ui = {
  theme = "rosepine",
  transparency = true,
  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    separator_style = "round", -- default/round/block/arrow
    overriden_modules = nil,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
    overriden_modules = nil,
  },

  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "default", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },

  hl_override = highlights.override,
  hl_add = highlights.add,

  telescope = {
    style = "bordered",
  }, -- borderless / bordered

  nvdash = {
    load_on_startup = true,
    header = {
      "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠓⠒⠤⢤⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⣀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣷⣶⣶⣦⣭⣓⢟⢻⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⡟⠽⣿⡍⡇⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿",
      "⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠉⠙⠛⠡⠀⠘⢟⠀⠀⠀⠀⠈⠉⠙⠘⠻⣿⠇⣿⣿",
      "⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⣲⣖⣒⢄⠻⣿",
      "⣿⣿⣿⣿⣿⣿⣿⡏⢃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣷⣼",
      "⣿⣿⣿⣿⣿⣿⡏⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠙⠻⡟⠙⢿⣿⣿",
      "⣿⣿⣿⣿⣿⣿⡇⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠇⠀⠀⠈⠲⣿⣿⣿",
      "⣿⣿⣿⣿⣿⣿⡇⡇⠀⠀⠀⠀⠀⠒⢤⣀⡀⠀⠀⠀⠀⠈⠀⠀⠀⠀⣸⣿⣿⣿",
      "⣿⣿⣿⣿⣿⣿⡇⡇⠀⠀⠀⠀⠀⠀⠀⠈⠂⠌⡑⠄⠀⠀⠀⠀⢀⢊⣾⣿⣿⣿",
      "⣿⣿⣿⣿⣿⣿⡇⡿⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⣾⣿⣿⣿⣿",
      "⣿⣿⣿⣿⣿⣿⣇⡇⠈⢻⣦⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣏⣿⣿⣿⣿⣿",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
      "⣿⣿git@github.com:linuxmobile⣿⣿",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    }
  },

  lsp = {
    -- show function signatures i.e args as you type
    signature = {
      disabled = false,
      silent = true, -- silences 'no signature help available' message from appearing
    },
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
M.settings = "custom.extras"

return M
