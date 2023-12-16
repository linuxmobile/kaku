local cmd = vim.cmd
local opt = vim.opt
local diagnostic = vim.diagnostic
local g = vim.g
local config = require("core.cfg")
opt.hidden = true
g.code_action_menu_window_border = 'single'
opt.ch = 0
g.currentTheme = config.colorscheme
g.theme_cache = vim.fn.stdpath "data" .. "/colors_data/"
g.statusStyle = config.statusstyle
opt.pumheight = 10
opt.fileencoding = 'utf-8'
opt.splitbelow = true
opt.list = true
opt.splitright = true
opt.termguicolors = true
opt.conceallevel = 0
opt.showtabline = 3
opt.tabline = ' '
opt.showmode = false
opt.backup = false
opt.number = true
opt.numberwidth = 3
opt.ruler = false
opt.writebackup = false
opt.updatetime = 300
opt.timeoutlen = 100
opt.clipboard = "unnamedplus"
opt.hlsearch = true
opt.ignorecase = true
opt.scrolloff = 0
opt.sidescrolloff = 5
opt.foldcolumn = '0' -- '0' is not bad
opt.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
opt.mouse = "a" -- Mouse support for noobs
opt.cursorline = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 0
opt.autoindent = true
opt.expandtab = true
opt.fillchars:append('eob: ')
opt.listchars:append "space: "
cmd('set lazyredraw')
cmd('set nolist')
opt.laststatus = 0                  -- Global Status
diagnostic.config { signs = false } -- Removing diagnostic column
opt.updatetime = 250
opt.shadafile = "NONE"
opt.shadafile = ""
opt.swapfile = false
opt.shortmess:append "sI"

-- Disabling some built in plugins
local builtins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "matchparen",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "logipat",
  "matchit",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
  "archlinux",
  "fzf",
  "tutor_mode_plugin",
  "sleuth",
  "vimgrep"
}

for _, plugin in ipairs(builtins) do
  g["loaded_" .. plugin] = 1
end
