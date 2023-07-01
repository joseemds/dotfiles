local ok, cmp = pcall(require, "cmp")
local luasnip = require("luasnip")


if not ok then
	return
end


cmp.setup {
		snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
		},
		mapping = cmp.mapping.preset.insert({
				['<C-d>'] = cmp.mapping.scroll_docs( -4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
		}),

		sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' }, -- For luasnip users.
		}, {
				{ name = 'buffer' },
		})

}
