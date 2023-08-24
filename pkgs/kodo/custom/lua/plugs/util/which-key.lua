local wk = require("which-key")
wk.setup {
}

local mappings = {
  q = {
    name = 'File',
    q = { ":q<cr>", "Quit" },
    w = { ":wq<cr>", "Save & Quit" },
    s = { ":w<cr>", "Save" },
    x = { ":bdelete<cr>", "Close" },
  },
  f = {
    name = 'Telescope',
    a = { ":Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find All Files" },
    b = { ":Telescope buffers <CR>", "Find Buffers" },
    c = { ":lua require('themes.schemer').setup(require('telescope.themes').get_dropdown{})<cr>", "Change Colorschemes" },
    f = { ":Telescope find_files<cr>", "Find Files" },
    h = { ":Telescope help_tags<cr>", "Find Help" },
    r = { ":Telescope oldfiles<cr>", "Recently Opened" },
    w = { ":Telescope live_grep <CR>", "Find Word" },
    z = { ":Telescope current_buffer_fuzzy_find <CR>", "Find in Buffer" },
  },
  G = {
    name = "Grapple",
    a = { ":GrappleTag<cr>", "Add A Bookmark" },
    t = { ":GrappleToggle<cr>", "Toggle Bookmark" },
    r = { ":GrappleUntag<cr>", "Remove Bookmark" },
    g = { ":GrapplePopup tags<cr>", "Show All Bookmarks" }
  },
  t = {
    name = "Terminal",
    t = { ":ToggleTerm<cr>", "Split Below" },
  },
  l = {
    name = "Misc",
    l = { ":Lazy<cr>", "Open Lazy" },
    c = { ":lua require('telescope') vim.lsp.buf.code_action()<cr>", "Show Code Actions" },
    m = { ":Mason<cr>", "Open Mason" },
    s = { ":SymbolsOutline<cr>", "Overview of file" },
    w = { ":SessionSave<cr>", "Save this session" }
  },
  h = {
    name = "Hop",
    c = { ":HopChar1<cr>", "Single Character" },
    C = { ":HopChar2<cr>", "Double Characters" },
    a = { ":HopAnywhere<cr>", "Anywhere" },
    l = { ":HopLine<cr>", "Line" },
    L = { ":HopLineStart<cr>", "Line Start" },
    v = { ":HopVertical<cr>", "Vertically" },
    w = { ":HopWord<cr>", "Word" },

  }
}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
