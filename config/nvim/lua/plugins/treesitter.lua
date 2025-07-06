return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end
	},
	"nvim-treesitter/nvim-treesitter-textobjects",
}
