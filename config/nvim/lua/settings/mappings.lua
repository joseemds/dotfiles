local map = vim.keymap.set

map('n', '<leader>e', "<cmd>FzfLua diagnostics_workspace <cr>")
map('n', '<leader>q', vim.diagnostic.setloclist)
map('n', 'yog', function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end)
