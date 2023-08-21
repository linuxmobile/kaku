-- thanks nvchad
local M = function(m)
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    if client.attached_buffers[vim.api.nvim_get_current_buf()] then
      if (m == 'minimal') then
        return "%#StalineLspIcon#" ..
            " LSP " .. "%#StalineLspNameNormal#" .. " " .. client.name .. " %#StalineEmptySpace#" .. " "
      elseif (m == 'fancy') then
        return "%#StalineLspIcon#" ..
            "   " .. "%#StalineLspName#" .. " " .. client.name .. " " .. "%#StalineEmptySpace#" .. " "
      else
        return 'f'
      end
    end
  end
end

return M
