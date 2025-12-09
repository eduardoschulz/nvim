return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("plugins.configs.snacks")
        end,
    }, 
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("plugins.configs.neotree")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        cmd = "Telescope",
        config = function(_)
            require "plugins.configs.telescope"
        end,
    },
}