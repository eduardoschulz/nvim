local lint = require("lint")
local map = vim.keymap.set

lint.linters_by_ft = {
    lua = { "luacheck" },
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    json = { "jsonlint" },
}

-- 2. Autocmd to Enable Linting on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        -- Only run linting if the file is tracked
        if not vim.g.autoformat_disabled then
            lint.try_lint()
        end
    end,
})
