return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = 'main',
        build = ":TSUpdate",
        init = function()
        --     local parser_installed = {
								-- "ocaml",
								-- "rust",
								-- "zig", "java",
								-- "elixir",
        --         "python",
        --         "go",
        --         "c",
        --         "lua",
        --         "vim",
        --         "vimdoc",
        --         "query",
        --         "markdown_inline",
        --         "markdown",
        --     }
								--
        --     vim.defer_fn(function() require("nvim-treesitter").install(parser_installed) end, 1000)
            -- require("nvim-treesitter").update()

            -- auto-start highlights & indentation
            vim.api.nvim_create_autocmd("FileType", {
                desc = "User: enable treesitter highlighting",
                callback = function(ctx)
                    -- highlights
                    local hasStarted = pcall(vim.treesitter.start)

                    local no_indent = {}
										local setup_textobjects = function(bufrn)
											local swap = require('nvim-treesitter-textobjects.swap')
											local move = require('nvim-treesitter-textobjects.move')

											local nmap = function(bufnr, key, fn, opts)
												vim.keymap.set("n", key, fn, { buffer = bufnr, noremap = true, silent = true, unpack(opts or {}) })
											end

											nmap(bufnr, "<leader>a", function() swap.swap_next("@parameter.inner") end)
											nmap(bufnr,"<leader>A", function() swap.swap_previous("@parameter.inner") end)

											nmap(bufnr,"]f", function() move.goto_next_start("@function.outer") end)
											nmap(bufnr,"]c", function() move.goto_next_start("@class.outer") end)
											nmap(bufnr,"]p", function() move.goto_next_start("@parameter.outer") end)
											nmap(bufnr,"]P", function() move.goto_next_start("@parameter.inner") end)

											nmap(bufnr,"[f", function() move.goto_previous_start("@function.outer") end)
											nmap(bufnr,"[c", function() move.goto_previous_start("@class.outer") end)
											nmap(bufnr,"[p", function() move.goto_previous_start("@parameter.outer") end)
											nmap(bufnr,"[P", function() move.goto_previous_start("@parameter.inner") end)
										end
                    if hasStarted and not vim.list_contains(no_indent, ctx.match) then
                        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"


												setup_textobjects(ctx.bufnr)
                    end
                end,
            })
        end
    }
}
