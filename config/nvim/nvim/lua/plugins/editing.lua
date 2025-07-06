return {
	"folke/zen-mode.nvim",
	"folke/twilight.nvim",
	{ "windwp/nvim-ts-autotag", config = true },
	{ "windwp/nvim-autopairs",  config = true },
	"tpope/vim-repeat",
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
		end
	},
	"tpope/vim-surround",
}
