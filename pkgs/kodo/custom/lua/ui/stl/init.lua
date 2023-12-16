local run = function(STYLE)
  local mode = require("ui.stl.modules.mode")
  local filename = require("ui.stl.modules.filename")
  local branch = require("ui.stl.modules.branch")
  local diff = require("ui.stl.modules.diff")
  local folder = require("ui.stl.modules.folder")
  local position = require("ui.stl.modules.position")
  local diagnostics = require("ui.stl.modules.diagnostics")
  local lsp = require("ui.stl.modules.lsp")
  return table.concat {
    mode(STYLE),
    filename(STYLE),
    branch(),
    diff(STYLE),
    "%=",
    diagnostics(STYLE),
    folder(STYLE),
    lsp(STYLE) or "",
    position(STYLE),
  };
end

local setup = function(STYLE)
  vim.opt.statusline = run(STYLE)
  vim.api.nvim_create_autocmd({ "ModeChanged", "CursorHold" }, {
    callback = function()
      vim.opt.statusline = run(STYLE)
    end
  })
end

return { run = run, setup = setup }
