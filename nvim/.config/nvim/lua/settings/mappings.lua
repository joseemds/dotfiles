local map = vim.keymap.set

map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<leader>e', "<cmd>Telescope diagnostics <cr>")
map('n', '<leader>q', vim.diagnostic.setloclist)
