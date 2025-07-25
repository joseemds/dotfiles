return {
	{'j-hui/fidget.nvim', config = true },
	"mfussenegger/nvim-dap",
	"VonHeikemen/lsp-zero.nvim",
	{
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      {"nvim-lua/plenary.nvim"},
    },
    event = "LspAttach",
    opts = {},
	}
}
