return {
    {
        'stevearc/conform.nvim',
        event = 'BufWritePre',
        opts = {
            notify_on_error = false,
            formatters_by_ft = {
				ocaml = {'ocamlformat', lsp_format = 'prefer'},
                c = { name = 'clangd', timeout_ms = 500, lsp_format = 'prefer' },
                javascript = { 'prettier', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
                javascriptreact = { 'prettier', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
                json = { 'prettier', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
                jsonc = { 'prettier', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
                less = { 'prettier' },
                lua = { 'stylua' },
                markdown = { 'prettier' },
                rust = { name = 'rust_analyzer', timeout_ms = 500, lsp_format = 'prefer' },
                scss = { 'prettier' },
                sh = { 'shfmt' },
                typescript = { 'prettier', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
                typescriptreact = { 'prettier', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
                ['_'] = { 'trim_whitespace', 'trim_newlines' },
            },
            format_on_save = function()
                if not vim.g.autoformat then
                    return nil
                end

                return {}
            end,
            formatters = {
                -- Require a Prettier configuration file to format.
                prettier = { require_cwd = true },
            },
        },
        init = function()
            -- Use conform for gq.
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

            -- Start auto-formatting by default (and disable with my ToggleFormat command).
            vim.g.autoformat = false
        end,
    },
}
