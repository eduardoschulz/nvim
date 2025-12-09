local snacks = require("snacks")

-- 1. Setup Options
snacks.setup({
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
})



-- 2. Define Keybindings
-- We use a helper variable 'map' for readability, or just vim.keymap.set directly
local map = vim.keymap.set

-- Picker (Telescope replacement)
map("n", "<leader>ff", function() snacks.picker.files() end, { desc = "Find Files" })
map("n", "<leader>fg", function() snacks.picker.grep() end, { desc = "Grep Text" })
map("n", "<leader>fb", function() snacks.picker.buffers() end, { desc = "Find Buffers" })

-- Explorer (File tree)
map("n", "<leader>e", function() snacks.explorer() end, { desc = "File Explorer" })

-- Utilities
map("n", "<leader>z", function() snacks.zen() end, { desc = "Toggle Zen Mode" })
map("n", "<leader>.", function() snacks.scratch() end, { desc = "Toggle Scratch Pad" })
map("n", "<leader>bd", function() snacks.bufdelete() end, { desc = "Delete Buffer" })
map("n", "<leader>g", function() snacks.lazygit() end, { desc = "Lazygit" })
