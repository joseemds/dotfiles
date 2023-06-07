local ok_lsp, lsp = pcall(require, "lspconfig")
local ok_cmp, cmplsp = pcall(require, "cmp_nvim_lsp")
local ok_mason, masonlsp = pcall(require, "mason-lspconfig")

if not (ok_lsp or ok_cmp or ok_mason) then
	return
end

local format_range = function()
	local start = vim.fn.getpos("v")
	local end_ = vim.fn.getpos(".")
	local start_row, start_col = start[2], start[3]
	local end_row, end_col = end_[2], end_[3]
	vim.lsp.buf.format({
			range = {
					['start'] = { start_row, start_col },
					['end'] = { end_row, end_col }
			}
	})
end

local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc }) end

	local vmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('v', keys, func, { buffer = bufnr, desc = desc })
	end


	nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
	nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	-- See `:help K` for why this keymap
	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Lesser used LSP functionality
	nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')
	vmap('<leader>lf', format_range, '[L]SP [F]ormat')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


local servers = {
		tsserver = {},
		clangd = {},
		lua_ls = {
				Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
				},
		},
		astro = {},
		tailwindcss = {
				tailwindCSS = {
						experimental = {
								classRegex = {
										{ "cva\\(([^)]*)\\)",
												"[\"'`]([^\"'`]*).*?[\"'`]" },
								},
						},
				}
		},
}


masonlsp.setup {
		ensure_installed = vim.tbl_keys(servers),
}


masonlsp.setup_handlers {
		function(server_name)
			require('lspconfig')[server_name].setup {
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
			}
		end,
}

lsp.ocamllsp.setup { file_types = { "ocaml", "reason", "dune", "menhir", "ocamllex" }, on_attach = on_attach, capabilities = capabilities }
lsp.gleam.setup { on_attach = on_attach, capabilities = capabilities }
lsp.hls.setup { on_attach = on_attach, capabilities = capabilities }
lsp.rust_analyzer.setup { on_attach = on_attach, capabilities = capabilities }
