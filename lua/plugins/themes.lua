return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000, -- Load this before everything else
        config = function()
            require("catppuccin").setup({
                flavour = "latte" -- latte, frappe, macchiato, mocha
            })
            vim.cmd.colorscheme "catppuccin"
        end,
    }
}