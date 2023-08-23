local null_ls = require "null-ls"
local format = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {

  -- webdev stuff
  -- format.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  format.prettier.with { filetypes = { "html", "markdown", "css", "astro", "javascript", "javascriptreact", "typescript", "typescriptreact", "markdown.mdx" } }, -- so prettier works only on these filetypes

  -- Lua
  format.stylua,

  -- Nix
  format.nixfmt,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
