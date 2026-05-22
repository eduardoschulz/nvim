return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.config.which-key")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.config.gitsigns")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.config.indent-blankline")
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.config.todo-comments")
    end,
  },
  {
    "folke/noice.nvim",
    event = "UIEnter",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("plugins.config.noice")
    end,
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
      suppressed_dirs = { "~", "/tmp" },
    },
    config = function(_, opts)
      require("auto-session").setup(opts)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.config.lualine")
    end,
  },
}
