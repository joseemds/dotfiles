local ok, fterm = pcall(require,"FTerm");

if not ok then
	return
end


fterm.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})


local lazygit = fterm:new({
	cmd = "lazygit"
})

-- Example keybindings
vim.keymap.set('n', '<C-s>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<C-s>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('n', '<leader>gg', function ()
	lazygit:toggle()
end)
