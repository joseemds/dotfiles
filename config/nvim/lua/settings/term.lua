local M = {}

M.terminal_send_cmd = function(cmd_text)
	local function get_first_terminal()
		local terminal_chans = {}
		for _, chan in pairs(vim.api.nvim_list_chans()) do
			if chan["mode"] == "terminal" and chan["pty"] ~= "" then
				table.insert(terminal_chans, chan)
			end
		end
		table.sort(terminal_chans, function(left, right)
			return left["buffer"] < right["buffer"]
		end)
		if #terminal_chans == 0 then
			return nil
		end
		return terminal_chans[1]["id"]
	end

	local send_to_terminal = function(terminal_chan, term_cmd_text)
		vim.api.nvim_chan_send(terminal_chan, term_cmd_text .. "\n")
	end

	local terminal = get_first_terminal()
	if not terminal then
		return nil
	end

	if not cmd_text then
		vim.ui.input({ prompt = "Send to terminal: " }, function(input_cmd_text)
			if not input_cmd_text then
				return nil
			end
			send_to_terminal(terminal, input_cmd_text)
		end)
	else
		send_to_terminal(terminal, cmd_text)
	end
	return true
end


vim.keymap.set("n", "<leader>yt", function () M.terminal_send_cmd() end)
	

return M
