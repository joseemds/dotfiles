return {
    {
        'nvim-treesitter/nvim-treesitter',
				"nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            {
                'nvim-treesitter/nvim-treesitter-context',
                opts = {
                    max_lines = 3,
                    multiline_threshold = 1,
                    min_window_height = 20,
                },
                keys = {
                    {
                        '[c',
                        function()
                            if vim.wo.diff then
                                return '[c'
                            else
                                vim.schedule(function()
                                    require('treesitter-context').go_to_context()
                                end)
                                return '<Ignore>'
                            end
                        end,
                        desc = 'Jump to upper context',
                        expr = true,
                    },
                },
            },
        },
        version = false,
        build = ':TSUpdate',
        opts = {
            ensure_installed = {
                'bash',
                'c',
                'cpp',
                'fish',
								'elixir',
                'gitcommit',
                'html',
                'java',
                'javascript',
                'json',
                'json5',
                'jsonc',
                'lua',
                'markdown',
                'markdown_inline',
								'ocaml',
                'python',
                'query',
                'regex',
                'rust',
                'scss',
                'toml',
                'tsx',
                'typescript',
                'vim',
                'vimdoc',
                'yaml',
            },
            highlight = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<cr>',
                    node_incremental = '<cr>',
                    scope_incremental = false,
                    node_decremental = '<bs>',
                },
            },
            indent = {
                enable = true,
                -- Treesitter unindents Yaml lists for some reason.
                disable = { 'yaml' },
            },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end,
    },
}
