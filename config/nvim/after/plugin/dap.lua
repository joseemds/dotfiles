local ok, dap = pcall(require, "dap")
local map = vim.keymap.set

if not ok then
	return
end

local dapui = require("dapui")

dapui.setup{}
require("nvim-dap-virtual-text").setup {}


dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end


map('n', "<leader>b", dap.toggle_breakpoint)
