local function trouble_remove_current_and_next()
	local trouble_win = nil
	local trouble_buf = nil

	-- Look through all windows in the current tabpage
	for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		local buf = vim.api.nvim_win_get_buf(win)
		local name = vim.api.nvim_buf_get_name(buf)

		-- Match exact buffer name that trouble.nvim uses
		if name == "Trouble" then
			trouble_win = win
			trouble_buf = buf
			break
		end
	end

	-- If no Trouble window found, show a warning and return
	if not trouble_win or not trouble_buf then
		vim.notify("Trouble window not found", vim.log.levels.WARN)
		return
	end

	-- Get current line in the Trouble window (line number, 1-based)
	local current_line = vim.api.nvim_win_get_cursor(trouble_win)[1]

	-- Make sure the line exists
	local line_count = vim.api.nvim_buf_line_count(trouble_buf)
	if current_line < 1 or current_line > line_count then
		return
	end

	-- Remove that line from the Trouble buffer
	vim.api.nvim_buf_set_lines(trouble_buf, current_line - 1, current_line, false, {})

	-- Move to next line (or stay at the last line)
	local next_line = math.min(current_line, line_count - 1)
	if next_line < 1 then
		next_line = 1
	end

	-- Move the cursor in the Trouble window to that line
	vim.api.nvim_win_set_cursor(trouble_win, { next_line, 0 })
end

-- Bind globally: ]n removes current line in Trouble list and moves to next
vim.keymap.set("n", "]n", trouble_remove_current_and_next, {
	desc = "Trouble: remove current item, move to next",
})
