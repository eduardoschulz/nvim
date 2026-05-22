local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.termguicolors = true
opt.clipboard = "unnamedplus"
opt.shell = "/bin/zsh"

vim.diagnostic.config({ virtual_text = true })

