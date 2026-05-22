require("gitsigns").setup({
  on_attach = function(bufnr)
    local gitsigns = require("gitsigns")

    vim.keymap.set("n", "]h", gitsigns.next_hunk, { buffer = bufnr, desc = "Next hunk" })
    vim.keymap.set("n", "[h", gitsigns.prev_hunk, { buffer = bufnr, desc = "Prev hunk" })
    vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
    vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
    vim.keymap.set("n", "<leader>hb", gitsigns.blame_line, { buffer = bufnr, desc = "Blame line" })
  end,
})
