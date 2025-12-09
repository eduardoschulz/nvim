-- 1. Setup Mason (The installer)
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls" }, -- Auto-install Lua LSP
})

-- 2. Setup Autocomplete (CMP)
local cmp = require("cmp")
local luasnip = require("luasnip")

--- LINTING SETUP (nvim-lint) ---
local lint = require("lint")
local map = vim.keymap.set

-- 1. Define Linters and prioritize Mason-installed versions
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



cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter to confirm
        ['<Tab>'] = cmp.mapping.select_next_item(),        -- Tab to go down
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),      -- Shift+Tab to go up
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, 
        { name = 'buffer' },
        { name = 'path' },
    })
})

-- 3. Setup LSP Servers
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua Server Setup
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }, -- Recognize the global 'vim' variable
            },
        },
    },
})

-- You can add other languages here, e.g.:
-- lspconfig.pyright.setup({ capabilities = capabilities })