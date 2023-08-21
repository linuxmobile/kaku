local fn = vim.fn
local M = function(m)
  local icon = "  "
  local filename = (fn.expand "%" == "" and "Empty ") or fn.expand "%:t"
  if filename ~= "Empty " then
    local devicons = require("nvim-web-devicons")
    local ft_icon, icon_hl = devicons.get_icon(filename)
    icon = (ft_icon ~= nil and " " .. ft_icon) or ""
    if not icon_hl then
      icon_hl = "StalineDefaultFile"
    end
    if filename == "NvimTree_1" then
      filename = "File Explorer"
    end
    if filename == "[startuptime]" then
      filename = "Startup Time"
    end
    if string.find(filename, "toggleterm") then
      filename = "Terminal"
    end
    if (m == 'minimal') then
      return "%#StalineFilenameIcon#" .. "%#" .. icon_hl .. "# " .. icon .. "  %#StalineFilename#" .. filename .. "  "
    elseif m == "fancy" then
      return "%#StalineFilenameFancy#" ..
          icon .. "  " .. filename .. "   " .. "%#StalineFilenameSep#" .. " %#StalineEmptySpace#"
    end
  else
    if (m == 'minimal') then
      return "%#StalineFilename#  Kodo "
    elseif m == "fancy" then
      return "%#StalineFilenameFancy#" .. "  Kodo  " .. "%#StalineFilenameSep#" .. " %#StalineEmptySpace#"
    end
  end
end
return M
