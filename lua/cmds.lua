vim.api.nvim_create_user_command('Format', function()
  vim.lsp.buf.format()
end, { desc = 'Format the file using the LSP support' })
