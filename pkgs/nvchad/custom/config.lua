-- This file contains changable values for custom functions

local M = {}

M.settings = {
  cc_size = "80", -- Color column neither pass list or string
  so_size = 10,   -- Scrolloff amount

  blacklist = {
    "NvimTree",
    "nvdash",
    "nvcheatsheet",
    "terminal",
    "Trouble",
    "help",
  },               -- Where to disable scrolloff and colorcolumn

  discord_rpc = 2, -- Value on how many nvim processes load presence.lua (1 - neovide, 2 - neovim)
}

return M
