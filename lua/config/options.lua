local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.number = true          -- Show line numbers
opt.relativenumber = true  -- Relative line numbers
opt.tabstop = 4            -- 4 spaces for tabs
opt.shiftwidth = 4         -- 4 spaces for indent width
opt.expandtab = true       -- Expand tabs to spaces
opt.termguicolors = true   -- Enable 24-bit RGB color
opt.clipboard = "unnamedplus" -- Sync with system clipboard