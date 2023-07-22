---@diagnostic disable: need-check-nil
local create_cmd = vim.api.nvim_create_user_command
local create_autocmd = vim.api.nvim_create_autocmd

local settings = require("custom.config").settings

create_autocmd({ "UIEnter" }, {
  once = true,
  callback = function()
    local function getcmd_output()
      local handle = io.popen "pgrep nvim | wc -l"
      local output = handle:read "*a"
      handle:close()
      return output
    end

    if tonumber(getcmd_output()) == settings.discord_rpc then
      require("lazy").load { plugins = { "presence.nvim" } }
    end
  end,
})
