local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Bootstrap: Clone lazy if not present
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup Lazy
require("lazy").setup({
    -- This tells lazy to import all files in lua/plugins automatically
  spec = {
    { import = "plugins" }, 
  },
  install = { colorscheme = { "catppuccin" }},
  
})