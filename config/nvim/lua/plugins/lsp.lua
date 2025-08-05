return {
	{'j-hui/fidget.nvim', config = true },
	"mfussenegger/nvim-dap",
	{
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      {"nvim-lua/plenary.nvim"},
    },
    event = "LspAttach",
    opts = {
			backend = "difftastic",
			picker = "select"
		},
	}
}
