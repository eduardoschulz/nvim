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
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/akinsho/toggleterm.nvim" },
  { src = "https://github.com/obsidian-nvim/obsidian.nvim"}
})

local actions = require("telescope.actions")
local telescope = require("telescope")
telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_previous,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      file_ignore_patterns = { "^%.git/" },
    },
  },
  extensions = {
    fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true },
  },
})
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

-- treesitter (nvim 0.12+: highlighting is built-in via vim.treesitter.start())
require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

-- ensure parsers are installed after startup
vim.schedule(function()
  local installed = require("nvim-treesitter.config").get_installed()
  local want = {
    "lua", "vim", "vimdoc",
    "javascript", "typescript", "tsx",
    "python", "rust", "go",
    "html", "css", "json", "yaml", "markdown",
    "c", "cpp",
  }
  local to_install = vim.tbl_filter(function(p)
    return not vim.list_contains(installed, p)
  end, want)
  if #to_install > 0 then
    require("nvim-treesitter.install").install(to_install, {})
  end
end)

-- toggleterm
require("toggleterm").setup({
  size      = 15,
  open_mapping = [[<C-\>]],
  direction = "horizontal",   -- "horizontal" | "vertical" | "float"
  shade_terminals = true,
})

--require("obsidian").setup({
--  picker = {
--    name = "telescope.nvim",
-- , }
--})
