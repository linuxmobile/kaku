local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local dashCfg = require("core.cfg").dashboard
local logo = dashCfg.header
local buttons = dashCfg.buttons
local message = dashCfg.message
local footer = dashCfg.footer

-- thanks dharmx
function makeButton(label, shortcut, hl_label, hl_icon)
  return {
    type = "button",
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(shortcut:gsub("%s", ""):gsub("LDR", "<leader>"), true, false, true)
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    val = " " .. label .. " ",
    opts = {
      position = "center",
      shortcut = " " .. shortcut .. " ",
      cursor = 5,
      width = 45,
      align_shortcut = "right",
      hl_shortcut = "AlphaKeyPrefix",
      hl = {
        { hl_icon,  0, 6 },  -- highlight the icon glyph
        { hl_label, 6, 30 }, -- highlight the part after the icon glyph
      },
    },
  }
end

dashboard.section.header.val = logo
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.val = {}

for _, j in ipairs(buttons) do
  local btn = makeButton(j[1], j[2], "AlphaLabel", "AlphaIcon")
  table.insert(dashboard.section.buttons.val, btn)
end

local heading = {
  type = "text",
  val = message,
  opts = {
    position = "center",
    hl = "AlphaMessage",
  },
}

dashboard.section.footer.val = footer
dashboard.section.footer.opts.hl = "AlphaFooter"
dashboard.config.opts.noautocmd = true
local opts = {
  layout = {
    { type = "padding", val = 2 },
    dashboard.section.header,
    { type = "padding", val = 1 },
    heading,
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    { type = "padding", val = 2 },
    dashboard.section.footer,
  },
  opts = {
    margin = 5
  },
}

alpha.setup(opts)
