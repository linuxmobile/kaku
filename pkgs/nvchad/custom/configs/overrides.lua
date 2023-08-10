local M = {}

M.treesitter = {
  ensure_installed = {
    "lua",
    "css",
    "javascript",
    "astro",
    "tsx",
    "typescript",
    "markdown",
    "nix",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "astro-language-server",
    "tailwindcss-language-server",
    "unocss-language-server",
    "typescript-language-server",
    "prettier",
    "json-lsp",
    "marksman",
    "nil",
    "rnix-lsp"
  },
}

-- git support in nvimtree
M.nvimtree = {
  filters = {
    dotfiles = true,
    custom = { "node_modules" },
  },
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.cmp = {
  sources = {
    name = "nvim_lsp",
    priority = 10,
    keyword_length = 6,
    group_index = 1,
    max_item_count = 15,
  },
}

return M
