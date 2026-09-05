-- configuraciones base de vim
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.expandtab = false
vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2 
vim.opt.termguicolors = true
--python3 provider
vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python")
-- KeyMaps
-- Moverse en+ h/j/k/l
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Ir a la ventana izquierda' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Ir a la ventana de abajo' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Ir a la ventana de arriba' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Ir a la ventana derecha' })
vim.keymap.set('n', '<leader>wn', '<C-w>n', { desc = "Crear nueva pestaña"})
vim.keymap.set('n', '<leader>wc', '<C-w>c', { desc = "Cerrar pestaña"})
-- CTRL-W c para cerrar una ventana
