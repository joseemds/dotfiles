local map = vim.keymap.set

map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '[b', "<cmd>:bp<cr>")
map('n', ']b', "<cmd>:bn<cr>")
map('n', '<leader>e', "<cmd>Telescope diagnostics <cr>")
map('n', '<leader>q', vim.diagnostic.setloclist)
map('n', '<C-t>p', "<cmd>:tabp<cr>")
map('n', '<C-t>n', "<cmd>:tabn<cr>")
