require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "javascript", "lua", "css", "astro", "tsx", "typescript", "tsx", "nix", "markdown", "html" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,


  highlight = {
    additional_vim_regex_highlighting = false,
  },
  autotag = { -- Auto tag html
    enable = true,
    filetypes = { "html", "javascriptreact", "typescriptreact" },
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil,  -- colors = {}, -- table of hex stringsnes = nil, -- Do not enable for files with more than n lines, int
    -- termcolors = {} -- table of colour name strings
  },
}
