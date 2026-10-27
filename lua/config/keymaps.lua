-- KeyMaps
-- Setting para leader = space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Moverse en+ h/j/k/l
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Ir a la ventana izquierda' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Ir a la ventana de abajo' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Ir a la ventana de arriba' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Ir a la ventana derecha' })

--Terminal
vim.keymap.set('n', '<leader>h', '<cmd>terminal<CR>',{ desc = "Abrir un terminal"})

--Buffers
vim.keymap.set('n', '<leader>wn', '<cmd>tabnew<CR>', { desc = "Crear nueva pestaña"})
vim.keymap.set('n', '<leader>wc', '<cmd>tabclose<CR>', { desc = "Cerrar pestaña"})
-- CTRL-W c para cerrar una ventanw  w
