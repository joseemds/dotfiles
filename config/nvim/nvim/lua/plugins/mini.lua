return {
	"echasnovski/mini.nvim",
	config = function ()
		local ai = require "mini.ai"
		require "mini.ai".setup({
			custom_textobjects = {
				F = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
				o = ai.gen_spec.treesitter({
					a = {'@conditional.outer',  '@loop.outer'},
					i = {'@conditional.inner', '@loop.inner'},
					p = ai.gen_spec.treesitter({ a = '@parameter.outer', i = '@parameter.inner' }),
				}),
			}
		})
		require "mini.pick".setup()
		require "mini.icons".setup()
		require "mini.pairs".setup()
		require "mini.diff".setup()
		require "mini.indentscope".setup()
		local hipatterns = require('mini.hipatterns')
		hipatterns.setup({
			highlighters = {
				fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
				hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
				todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
				note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})
		require "mini.files".setup({})
		require "mini.surround".setup({
			mappings = {
				add = 'ya', -- Add surrounding in Normal and Visual modes
				delete = 'yd', -- Delete surrounding
				find = 'yf', -- Find surrounding (to the right)
				find_left = 'yF', -- Find surrounding (to the left)
				highlight = 'yh', -- Highlight surrounding
				replace = 'yr', -- Replace surrounding
				update_n_lines = 'yn', -- Update `n_lines`
				suffix_last = 'l', -- Suffix to search with "prev" method
				suffix_next = 'n', -- Suffix to search with "next" method
			},
		})
	end
}
