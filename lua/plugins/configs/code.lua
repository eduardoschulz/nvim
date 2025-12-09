local cmp = require("cmp")
local luasnip = require("luasnip")

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
