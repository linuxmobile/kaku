local mason = require("mason")

local options = {
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
   }, -- not an option from mason.nvim

  ui = {
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = "󰚌",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
  vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
end, {})



mason.setup(options)
