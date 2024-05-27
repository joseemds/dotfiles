local map = vim.keymap.set

map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)

map('n', '<leader>e', "<cmd>Telescope diagnostics <cr>")
map('n', '<leader>q', vim.diagnostic.setloclist)
map('n', '<tab>', "<cmd>:tabn<cr>")
map('n', '<S-tab>', "<cmd>:tabp<cr>")

map('n', ",q", "<cmd>:copen<cr>")
map('n', "]q", "<cmd>:cnext<cr>")
map('n', "[q", "<cmd>:cprev<cr>")
