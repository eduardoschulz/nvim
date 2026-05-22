local keymap = vim.keymap.set

keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })

keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

keymap("n", "<C-\\>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float terminal" })
keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Horizontal terminal" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Vertical terminal" })

local git = require("custom.git")
keymap("n", "<leader>gs", function() git.status() end, { desc = "Git status" })
keymap("n", "<leader>gd", function() git.diff() end, { desc = "Git diff HEAD~1" })
keymap("n", "<leader>ga", function() git.commit() end, { desc = "Git commit" })
keymap("n", "<leader>gl", function() git.log() end, { desc = "Git log" })
keymap("n", "<leader>gb", function() git.blame() end, { desc = "Git blame" })
keymap("n", "<leader>gp", function() git.pull() end, { desc = "Git pull" })
keymap("n", "<leader>gc", function() git.checkout() end, { desc = "Git checkout" })

keymap("n", "<leader>j", "<cmd>bnext<cr>", { desc = "Next buffer" })
keymap("n", "<leader>k", "<cmd>bprev<cr>", { desc = "Previous buffer" })
keymap("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
keymap("n", "<leader><tab>", "<cmd>e #<cr>", { desc = "Last buffer" })
