require('nvim-biscuits').setup({
  default_config = {
    max_length = 6,
    min_distance = 5,
    prefix_string = " 󰈼 ",
  },
  language_config = {
    markdown = {
      disabled = true,
    }
  },
  decorate_fn = function(bufnr, nodes)
    for _, node in ipairs(nodes) do
      local line = node.range.start.line
      if line >= 0 and line <= vim.api.nvim_buf_line_count(bufnr) then
        vim.api.nvim_buf_set_extmark(bufnr, 0, line, 0, {
          id = node.id,
          virt_text = {{node.config.prefix_string, node.config.hl}},
          virt_text_pos = 'overlay',
          hl_mode = 'combine',
        })
      else
        print("Invalid line number: " .. line)
      end
    end
  end,
})