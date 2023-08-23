local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "astro", "tailwindcss", "nil_ls", "rnix", "unocss" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  lspconfig.tailwindcss.setup {
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "astro" },
    root_dir = require("lspconfig/util").root_pattern("tailwind.config.js", "tailwind.config.ts"),
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
