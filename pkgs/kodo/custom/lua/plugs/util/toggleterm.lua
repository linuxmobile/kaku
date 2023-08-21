require "toggleterm".setup {
  size = 13,
  shading_factor = '-27',
  open_mapping = [[<c-\>]],
  shade_filetypes = { "toggleterm" },
  shade_terminals = true,
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal',
  float_opts = {
    winblend = 3,
  },
  winbar = {
    enabled = false,
  },

}
