require("nvim-treesitter.config").setup({
  ensure_installed = { "lua", "go", "python", "c", "cpp", "yaml", "json", "markdown", "bash" },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
