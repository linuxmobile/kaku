require("grapple").setup({
  ---@type "debug" | "info" | "warn" | "error"
  log_level = "warn",
  ---Can be either the name of a builtin scope resolver,
  ---or a custom scope resolver
  scope = "git",
  ---The save location for tags
  ---@type string
  save_path = tostring(vim.fn.stdpath("data") .. "/grapple"),
  ---Window options used for the popup menu
  popup_options = {
    relative = "editor",
    width = 65,
    height = 12,
    style = "minimal",
    focusable = false,
    border = "rounded",
  },
  integrations = {
    ---Support for saving tag state using resession.nvim
    resession = false,
  },
})
