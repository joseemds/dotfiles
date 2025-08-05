vim.filetype.add({
	extension = {}
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function(args) 
		if vim.bo[bufnr].filetype ~= 'bigfile' and pcall(vim.treesitter.start, bufnr) then
			vim.api.nvim_buf_call(bufnr, function()
				vim.wo[0][0].foldmethod = 'expr'
				vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
				vim.cmd.normal 'zx'
			end)
		else
			-- Else just fallback to using indentation.
			vim.wo[0][0].foldmethod = 'indent'
		end

	end,
})
