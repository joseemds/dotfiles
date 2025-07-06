local cmd = vim.api.nvim_command

cmd("syntax on")
cmd("set rnu")
cmd("set nu")
cmd("set hidden")
cmd("set noswapfile")
cmd("set matchpairs+=<:>")

vim.o.fillchars = "eob: "
vim.o.completeopt = "menuone,noselect"
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true

vim.diagnostic.config({
	virtual_lines = true,
})
