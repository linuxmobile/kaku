local has_value = function(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end
  return false
end

local available_themes = { 'minimal', 'fancy' }
vim.api.nvim_create_user_command(
  'StatuslineGlowup',
  function(opts)
    if has_value(available_themes, opts.args) then
      vim.g.statusStyle = opts.args
      require("ui.stl").setup(opts.args)
    else
      print 'Invalid Theme'
    end
  end,
  {
    nargs = 1,
    complete = function()
      return available_themes
    end,
  }
)
