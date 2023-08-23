-- n, v, i, t = mode names
-- map('modeName', 'key', replacedCommand, {'options'})

vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap

-- INSERT MODE --
map('i', '<C-b>', '<ESC>^i', { noremap = true, silent = true })
map('i', '<C-e>', '<End>', { noremap = true, silent = true })
-- map('i', '<C-e>', '<ESC>:normal! A<End><CR>', { noremap = true, silent = true })
map('i', '<C-h>', '<Left>', { noremap = true, silent = true })
map('i', '<C-l>', '<Right>', { noremap = true, silent = true })
map('i', '<C-j>', '<Down>', { noremap = true, silent = true })
map('i', '<C-k>', '<Up>', { noremap = true, silent = true })

-- NORMAL MODE --

-- CLEAR HIGHLIGHTS --
map('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true })
-- MOVE BTW BUFFERS --
map('n', '<C-h>', '<C-w>h', { noremap = true, silent = false })
map('n', '<C-l>', '<C-w>l', { noremap = true, silent = false })
map('n', '<C-j>', '<C-w>j', { noremap = true, silent = false })
map('n', '<C-k>', '<C-w>k', { noremap = true, silent = false })
-- CLOSE BUFFER --
map('n', '<leader>x', ':bd<CR>', { noremap = true, silent = true })

-- SAVE --
map('n', '<C-s>', '<cmd> w <CR>', { noremap = true, silent = true })
-- COPY ALL--
map('n', '<C-c>', '<cmd> %y+ <CR>', { noremap = true, silent = true })
-- TOGGLE LINE NUMBER --
map('n', '<leader>n', '<cmd> set nu! <CR>', { noremap = true, silent = true }) -- number
map('n', '<leader>rn', '<cmd> set rnu! <CR>', { noremap = true, silent = true }) -- relative number

-- NVCHAD THINGS --
-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map('n', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { noremap = true, silent = true, expr = true })
map('n', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { noremap = true, silent = true, expr = true })
map('n', '<Up>', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { noremap = true, silent = true, expr = true })
map('n', '<Down>', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { noremap = true, silent = true, expr = true })

-- FORMATING --
map('n', '<leader>fm', ':lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true })

-- NVIMTREE --
map('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
map('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- TOGGLE TERM --
map('n', '<A-h>', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true }) -- horizontal
map('n', '<A-v>', '<cmd>ToggleTerm direction=vertical size=50<CR>', { noremap = true, silent = true }) -- vertical
map('n', '<A-i>', '<cmd>ToggleTerm direction=float<CR>', { noremap = true, silent = true }) -- floating

-- TELESCOPE --
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
map('n', '<leader>fa', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true <CR>', { noremap = true, silent = true })
map('n', '<leader>fw', '<cmd> Telescope live_grep <CR>', { noremap = true, silent = true })
map('n', '<leader>fb', '<cmd> Telescope buffers <CR>', { noremap = true, silent = true })
map('n', '<leader>fh', '<cmd> Telescope help_tags <CR>', { noremap = true, silent = true })
map('n', '<leader>fo', '<cmd> Telescope oldfiles <CR>', { noremap = true, silent = true })
map('n', '<leader>fz', '<cmd> Telescope current_buffer_fuzzy_find <CR>', { noremap = true, silent = true })

-- TELESCOPE GIT --
map('n', '<leader>cm', '<cmd> Telescope git_commits <CR>', { noremap = true, silent = true })
map('n', '<leader>gt', '<cmd> Telescope git_status <CR>', { noremap = true, silent = true })

map('n', 'zR', ':lua require("ufo").openAllFolds<CR>', { noremap = true, silent = true })
map('n', 'zM', ':lua require("ufo").closeAllFolds<CR>', { noremap = true, silent = true })

-- COMMENT --
vim.api.nvim_set_keymap('n', '<leader>/', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', { noremap = true, silent = true })
-- map('n', '<leader>/', ':CommentToggle<CR>', { noremap = true, silent = true })
map('v', '<leader>/', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { noremap = true, silent = true })