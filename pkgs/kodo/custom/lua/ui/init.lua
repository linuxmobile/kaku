vim.api.nvim_create_autocmd({ "CursorHold", "UIEnter" }, {
  callback = function()
    vim.opt.laststatus = 3 -- Global Status
    require("ui.stl").setup(vim.g.statusStyle)
    require("ui.buf").setup()
  end
})
