local map = vim.api.nvim_set_keymap 
local ok, telescope = pcall(require, "telescope")

local silent_opts = {noremap = true, silent = true}

require("telescope").setup{}

map('n', '<C-p>',':Telescope find_files<CR>', silent_opts)




