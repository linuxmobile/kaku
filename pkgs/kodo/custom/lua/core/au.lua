-- Formatting Code on Save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    for _, client in ipairs(vim.lsp.get_active_clients()) do
      if client.attached_buffers[vim.api.nvim_get_current_buf()] then
        vim.lsp.buf.format()
        return
      else
        return
      end
    end
  end
})
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  callback = function()
    require("themes").load()
  end
})

vim.api.nvim_create_autocmd({ "UIEnter" }, {
  callback = function()
    require("themes").load()
    local should_skip = false
    if vim.fn.argc() > 0 or vim.fn.line2byte "$" ~= -1 or not vim.o.modifiable then
      should_skip = true
    else
      for _, arg in pairs(vim.v.argv) do
        if arg == "-b" or arg == "-c" or vim.startswith(arg, "+") or arg == "-S" then
          should_skip = true
          break
        end
      end
    end
    if not should_skip then vim.cmd("Alpha") end
  end
})
