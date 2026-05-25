vim.pack.add({
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("^1"), 
  },
})

require("blink.cmp").setup({
  keymap = { preset = "super-tab" },
  appearance = { nerd_font_variant = "mono" },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  completion = {
    documentation = { auto_show = true },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
