local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "astro",
    "tsx",
    "typescript",
    "markdown",
    "markdown_inline",
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
    "html-lsp",
    "astro-language-server",
    "tailwindcss-language-server",
    "unocss-language-server",
    "typescript-language-server",
    "deno",
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
