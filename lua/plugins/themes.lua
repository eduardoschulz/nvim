return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "night",
    },
  },
}
