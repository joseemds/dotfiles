local map = vim.api.nvim_set_keymap
local ok, telescope = pcall(require, "telescope")

if not ok then
	return
end

local silent_opts = {noremap = true, silent = true}

telescope.setup{
	defaults = {
		file_ignore_patterns = {"node_modules", "esy.lock"},
		preview = {
			filesize_hook = function(filepath, bufnr, opts)
				local max_bytes = 10000
				local cmd = {"head", "-c", max_bytes, filepath}
				require('telescope.previewers.utils').job_maker(cmd, bufnr, opts)
			end
		}
	}

}

map('n', '<C-p>',':Telescope find_files<CR>', silent_opts)
map('n', '<leader>lg',':Telescope live_grep<CR>', silent_opts)
map('n', '<leader>bb',':Telescope buffers<CR>', silent_opts)
