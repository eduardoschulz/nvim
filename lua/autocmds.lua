local my_augroup = vim.api.nvim_create_augroup('CustomSettings', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = my_augroup,
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
  desc = 'Disable auto-commenting on new lines',
})

vim.api.nvim_create_autocmd('FileType', {
  group = my_augroup,
  pattern = '*',
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
  desc = 'Start treesitter highlighting if parser available',
})

