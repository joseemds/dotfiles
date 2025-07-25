local ok, neotest = pcall(require, "neotest")

if not ok then
	return
end

local map = vim.keymap.set

neotest.setup {
	adapters = {
		require("neotest-java"),
		require("neotest-go"),
	}
}


map('n', "<leader>tt", function() neotest.run.run() end)
map('n', "<leader>ta", function() neotest.run.run(vim.fn.expand("%s")) end)
map('n', "<leader>to", function() neotest.summary.toggle() end)

