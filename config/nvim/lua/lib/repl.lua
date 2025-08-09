-- TODO: keybinding keep changing identation

local api = vim.api
local map = vim.keymap.set
local M = {}

M.get_buf = function ()
	if not M.bufnr or not api.nvim_buf_is_valid(M.bufnr) then
		M.bufnr = api.nvim_create_buf(false, true)
	end
return M.bufnr

end

M.get_selected_text = function ()
	local _, start_line = vim.fn.getpos("'<")
	local _, end_line = vim.fn.getpos("'>")
	local content = api.nvim_buf_getlines("%", start_line, end_line, true)

	return ""
end

M.create_repl = function ()
	local buf = M.get_buf()
	vim.cmd("rightb vnew")
	api.nvim_set_current_buf(buf)
end

M.send_text = function ()
	if not M.bufnr or not api.nvim_buf_is_valid(M.bufnr) then
		local original_win = api.nvim_get_current_win()
		M.create_repl()
		api.nvim_set_current_win(original_win)
	end

	local start_line, start_col = unpack(api.nvim_buf_get_mark(0, '<'))
	local end_line, end_col = unpack(api.nvim_buf_get_mark(0, '>'))

	local lines = api.nvim_buf_get_text(0, start_line - 1, start_col, end_line - 1, end_col, {})
	print(lines)

	api.nvim_buf_set_lines(M.bufnr, -1, -1, false, lines)
	api.nvim_buf_set_lines(M.bufnr, -1, -1, false, { "" })

	local win_id = vim.fn.bufwinid(M.bufnr)
	local line_count = vim.api.nvim_buf_line_count(M.bufnr)
	api.nvim_win_set_cursor(win_id, {line_count, 0})
end

map("n", "<leader>rl", function () M.create_repl() end)
map("v", "<leader>rl", function () 
	M.send_text() 
	vim.cmd("normal <Esc>")
end)

return M
