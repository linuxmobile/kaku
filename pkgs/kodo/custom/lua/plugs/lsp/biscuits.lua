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
  }
})
