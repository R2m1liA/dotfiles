return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  opts = {
    check_ts = true,
    ts_config = {
      lua = { "string", "comment"},
    },
    enable_bracket_in_quote = false,
  }
}
