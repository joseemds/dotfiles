require'nvim-treesitter.configs'.setup {
  textobjects = {
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
    },
		lsp_interop = {
			enable = true,
			peek_definition_code = {
				["<leader>df"] = "@function.outer",
				["<leader>dF"] = "@class.outer",
			},
		}
  },
}
