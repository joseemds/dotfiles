require('nvim-treesitter.configs').setup {
		ensure_installed = { 'c', 'lua', 'python', 'rust', 'typescript', 'tsx', 'help', 'vim', 'ocaml', 'ocamllex', 'ocaml_interface', 'menhir', 'nix', 'haskell', 'elm', 'elixir', 'css', 'html', 'javascript','bash', 'make', 'json', 'gleam', 'gitcommit', 'gitignore'},
		highlight = { enable = true,
				disable = function(_lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
		},
		indent = { enable = true, disable = { 'python' } },
		autotag = { enable = true },
		incremental_selection = {
				enable = true,
				keymaps = {
						init_selection = '<c-space>',
						node_incremental = '<c-space>',
						scope_incremental = '<c-s>',
						node_decremental = '<c-backspace>',
				},
		},
		textobjects = {
				select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
								-- You can use the capture groups defined in textobjects.scm
								['aa'] = '@parameter.outer',
								['ia'] = '@parameter.inner',
								['af'] = '@function.outer',
								['if'] = '@function.inner',
								['ac'] = '@class.outer',
								['ic'] = '@class.inner',
						},
				},
				move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
								[']m'] = '@function.outer',
								[']]'] = '@class.outer',
						},
						goto_next_end = {
								[']M'] = '@function.outer',
								[']['] = '@class.outer',
						},
						goto_previous_start = {
								['[m'] = '@function.outer',
								['[['] = '@class.outer',
						},
						goto_previous_end = {
								['[M'] = '@function.outer',
								['[]'] = '@class.outer',
						},
				},
				swap = {
						enable = true,
						swap_next = {
								['<leader>a'] = '@parameter.inner',
						},
						swap_previous = {
								['<leader>A'] = '@parameter.inner',
						},
				},
		},
}
