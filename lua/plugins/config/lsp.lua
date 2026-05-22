local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.enable({
  lua_ls = {
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
  gopls = {
    capabilities = capabilities,
  },
  yamlls = {
    capabilities = capabilities,
  },
  clangd = {
    capabilities = capabilities,
  },
  pyright = {
    capabilities = capabilities,
  },
})
