local map = vim.api.nvim_set_keymap
local ok, telescope = pcall(require, "telescope")

if not ok then
	return
end

local silent_opts = { noremap = true, silent = true }

telescope.load_extension("undo")

telescope.setup {
	defaults = {
		file_ignore_patterns = { "node_modules", "esy.lock", ".git/" },
		preview = {
			filesize_hook = function(filepath, bufnr, opts)
				local max_bytes = 10000
				local cmd = { "head", "-c", max_bytes, filepath }
				require('telescope.previewers.utils').job_maker(cmd, bufnr, opts)
			end
		}
	},
	pickers = {
		find_files = {
			hidden = true
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}

}

map('n', '<C-p>', ':Telescope find_files<CR>', silent_opts)
map('n', '<leader>lg', ':Telescope live_grep<CR>', silent_opts)
