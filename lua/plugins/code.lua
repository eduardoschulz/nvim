-- plugins for coding
return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            -- Package Manager for LSP servers
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            
            -- Snippets (Required for nvim-cmp to work properly)
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        {
        "mfussenegger/nvim-lint",
        event = "BufWritePost", -- Run after saving
        },
        config = function()
            -- This loads the file at lua/plugins/configs/code.lua
            require("plugins.configs.code")
        end,
    }
}