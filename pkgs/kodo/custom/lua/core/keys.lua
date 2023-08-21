vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap

-- Moving Between Buffers
map('n', '<C-h>', '<C-w>h', { noremap = true, silent = false })
map('n', '<C-l>', '<C-w>l', { noremap = true, silent = false })
map('n', '<C-j>', '<C-w>j', { noremap = true, silent = false })
map('n', '<C-k>', '<C-w>k', { noremap = true, silent = false })

map('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
map('n', '<C-f>', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
map('n', '<C-\\>', ':ToggleTerm<CR>', { noremap = true, silent = true })

map('n', 'zR', ':lua require("ufo").openAllFolds<CR>', { noremap = true, silent = true })
map('n', 'zM', ':lua require("ufo").closeAllFolds<CR>', { noremap = true, silent = true })
