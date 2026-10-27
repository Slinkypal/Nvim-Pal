local g = vim.g

-- configuraciones base de vim
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.wrap = false

-- Portapapeles
vim.opt.clipboard = "unnamedplus"

-- Indentación
vim.opt.expandtab = false 
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2 

vim.opt.termguicolors = true

-- terminal


--python3 provider
g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python")

