local pickers      = require "telescope.pickers"
local finders      = require "telescope.finders"
local actions      = require "telescope.actions"
local action_state = require "telescope.actions.state"
local conf         = require("telescope.config").values

local M            = {}

local schemes      = {}
local files        = vim.fn.stdpath "config" .. "/colors/"
for _, file in ipairs(vim.fn.readdir(files)) do
  local f = vim.fn.fnamemodify(file, ":r")
  table.insert(schemes, f)
end

M.setup = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Kolorschemes",
    finder = finders.new_table {
      results = schemes
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(buffer)
      actions.select_default:replace(function()
        local theme = action_state.get_selected_entry().value
        vim.g.currentTheme = theme
        vim.cmd("colorscheme " .. theme)
        actions.close(buffer)
      end)
      return true
    end,
  }):find()
end

return M
