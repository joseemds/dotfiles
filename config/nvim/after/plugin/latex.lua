vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
	pattern = "*.tex",
	command = "VimtexCompilelatex"

})

vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'
vim.g.tex_conceal = 'abdmg'
vim.g.vimtex_compile_latexmk = {
  executable = "latexmk",
	out_dir = "out",
  OPTIONS = {
    "-lualatex",
    "-fine-line-error",
    "-synctex=1",
    "-interactions=nonstopmode",
  },
}

