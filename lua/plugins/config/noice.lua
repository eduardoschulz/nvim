require("noice").setup({
  lsp = {
    override = {
      "vim.lsp.util.convert_input_to_markdown_lines",
      "vim.lsp.util.stylize_markdown",
      "cmp.entry.get_documentation",
    },
    hover = { enabled = true },
    signature = { enabled = true },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = true,
  },
})
