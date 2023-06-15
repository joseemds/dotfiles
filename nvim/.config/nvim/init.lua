vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
		{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim"} },
		{ "nvim-treesitter/nvim-treesitter", build = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end
		},
		"nvim-treesitter/playground",
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-textobjects",
		{ "neovim/nvim-lspconfig", dependencies = {
				{ 'williamboman/mason.nvim', config = true },
				'williamboman/mason-lspconfig.nvim',

				-- Useful status updates for LSP
				{ 'j-hui/fidget.nvim',       config = true },

				-- Additional lua configuration, makes nvim stuff amazing
				{ 'folke/neodev.nvim',       config = true } }
		},
		"ms-jpq/coq_nvim",
		{ "numToStr/FTerm.nvim",           config = true },
		{ "numToStr/Comment.nvim",         config = true },
		{"tamago324/lir.nvim",
			dependencies = {
			"tamago324/lir-git-status.nvim"
			}
		},
		"tpope/vim-surround",
		"nvim-tree/nvim-web-devicons",
		"lukas-reineke/indent-blankline.nvim",
		{ "ggandor/leap.nvim", config = function()
			require("leap").add_default_mappings()
		end },
		"sindrets/diffview.nvim",
		{ "windwp/nvim-ts-autotag", config = true },
		{ "windwp/nvim-autopairs",  config = true },

		--themes
		"folke/tokyonight.nvim",
		"shatur/neovim-ayu",
		"sainnhe/everforest",
		"rebelot/kanagawa.nvim",
		{"catppuccin/nvim", name = "catppuccin", lazy= false},

		-- cmp
		{ 'hrsh7th/nvim-cmp',
			dependencies = {
				'hrsh7th/cmp-nvim-lua',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-cmdline',
				"hrsh7th/cmp-nvim-lsp",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip"
			},
		},
		"danielo515/nvim-treesitter-reason",
		{ dir = "$HOME/dev/lua/todo.nvim" },
		{"christoomey/vim-tmux-navigator", lazy = false}
})

require "settings"
