local comments = require('nvim_comment')
comments.setup {
  marker_padding = true,
  comment_empty = true,
  comment_empty_trim_whitespace = true,
  create_mappings = true,
  line_mapping = "kcc",
  operator_mapping = "kc",
  comment_chunk_text_object = "ic",
  hook = nil
}
