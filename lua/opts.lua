local opt = vim.opt
vim.g.mapleader = " "
-- Prevents showing extra messages when using completion
opt.shortmess:append("c")
-- Sets the height of the command line area at the bottom
opt.cmdheight = 2
-- Displays the line number for the current line
opt.number = true
-- Displays line numbers relative to the current cursor position
opt.relativenumber = false
-- Time in milliseconds to wait for a mapped sequence to complete
opt.ignorecase = true
-- Automatically switches to case-sensitive search if a capital letter is used
opt.smartcase = true
-- Enables 24-bit RGB colors in the terminal
opt.termguicolors = true
opt.tabstop = 2
-- Number of spaces to use for each step of automatic indentation
opt.shiftwidth = 2
-- Number of spaces that a <Tab> counts for during editing operations
opt.softtabstop = 2
-- Converts tabs into spaces when typing
opt.expandtab = true
-- Automatically inserts an extra level of indentation in some cases
opt.smartindent = true
-- Makes <Tab> insert 'shiftwidth' number of spaces at the start of a line
opt.smarttab = true
opt.clipboard = "unnamedplus"
opt.shell = "/bin/zsh"
