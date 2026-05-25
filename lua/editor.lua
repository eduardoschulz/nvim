vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  {
    src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
  },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },    -- bufferline dep
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = "https://github.com/windwp/nvim-autopairs" },
  -- {
  --   src     = "https://github.com/nvim-treesitter/nvim-treesitter",
  --   version = "main",                                             -- use main branch
  --   build   = ":TSUpdate",
  -- },
  { src = "https://github.com/akinsho/toggleterm.nvim" },
})

local telescope = require("telescope")
pcall(telescope.load_extension, "fzf")

-- keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files,  { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep,   { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,     { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags,   { desc = "Help tags" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles,    { desc = "Recent files" })

-- bufferline
require("bufferline").setup()

-- autopairs
require("nvim-autopairs").setup()

-- -- treesitter
-- require("nvim-treesitter").setup({
--   ensure_installed = {
--     "lua", "vim", "vimdoc",
--     "javascript", "typescript", "tsx",
--     "python", "rust", "go",
--     "html", "css", "json", "yaml", "markdown",
--   },
--   highlight = { enable = true },
--   indent    = { enable = true },
-- })

-- toggleterm
require("toggleterm").setup({
  size      = 15,
  open_mapping = [[<C-\>]],
  direction = "horizontal",   -- "horizontal" | "vertical" | "float"
  shade_terminals = true,
})
