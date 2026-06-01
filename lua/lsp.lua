vim.pack.add({
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
})

local lsp_servers = {
--  'pyright',
  'pylsp',
  'clangd',
  'lua_ls',
  'gopls',
  'yamlls',
}

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = lsp_servers,
  automatic_enable = false, 
})


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'if_many',
    header = '',
    prefix = '',
  },
})

vim.lsp.config('*', {
  capabilities = capabilities,
})

local function has_lsp_config(server_name)
  local config_path = vim.fn.stdpath("config")
  local target_path = vim.fs.joinpath(config_path, "lua/lsp", server_name .. ".lua")
  if vim.uv.fs_stat(target_path) then
    return true
  else
    return false
  end
end

--vim.iter(lsp_servers):each(
--function(lsp_server)
--  if not has_lsp_config(lsp_server) then
--    vim.api.nvim_echo({ { 'Warning. lsp server ' .. lsp_server .. ' has no config file in the config lsp folder.' , 'WarningMsg' } }, true, {})
--    else
--      vim.lsp.enable(lsp_server)
--  end
--end
--)
vim.iter(lsp_servers):each(function(lsp_server)
  if has_lsp_config(lsp_server) then
    vim.lsp.config(lsp_server, require('lsp.' .. lsp_server))
  end
  vim.lsp.enable(lsp_server)
end)

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover' })

