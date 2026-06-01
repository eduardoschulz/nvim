vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/catppuccin/nvim" },
  { src = "https://github.com/rose-pine/neovim" },  -- light: rose-pine-dawn
  { src = "https://github.com/AstroNvim/astrotheme" },
})

require("astrotheme").setup({ palette = "astrodark" })
vim.cmd.colorscheme("astrotheme")
