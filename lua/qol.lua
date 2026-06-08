vim.pack.add({
  -- dependencies
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },

  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
  { src = "https://github.com/folke/todo-comments.nvim" },
  { src = "https://github.com/folke/noice.nvim" },
  { src = "https://github.com/rmagatti/auto-session" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require("which-key").setup()
require("gitsigns").setup()
require("ibl").setup()
require("todo-comments").setup()
require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["vim.lsp.util.open_floating_preview"] = true,
    },
    progress = { enabled = false },
    hover = { enabled = true },
    signature = { enabled = false },
    message = { enabled = false },
  },
})



vim.lsp.handlers['window/showMessage'] = function() end
require("auto-session").setup()
require("lualine").setup()
