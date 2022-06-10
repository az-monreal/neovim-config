--[[
--TODO:
--	renmae variables
--	? validate string
--	format string
]]

function makeColumns()
	-- print("hi")
	local _, sel_srow, sel_scol, _ = unpack(vim.fn.getpos("'<"))
	local _, sel_erow, sel_ecol, _ = unpack(vim.fn.getpos("'>"))
	-- if csrow < cerow or (csrow == cerow and cscol <= cecol) then
	-- 	return csrow - 1, cscol - 1, cerow - 1, cecol
	-- else
	-- 	return cerow - 1, cecol - 1, csrow - 1, cscol
	-- end

	--[[ print("start:" .. csrow .. "," .. cscol)
	print("end:" .. cerow .. "," .. cecol) ]]

	-- local lines = vim.api.nvim_buf_get_text(0, csrow, cscol, cerow, cecol, {})
	-- local line = vim.api.nvim_buf_get_text(0, csrow - 1, cscol - 1, csrow - 1, cecol, {})
	-- for _, v in ipairs(lines) do
	-- 	print(v)
	-- end

	for i = sel_srow - 1, sel_erow - 1 do
		local line_ecol = sel_ecol

		print(string.len(vim.fn.getline(i + 1)))

		local line_length = string.len(vim.fn.getline(i + 1)) + 1

		if line_ecol > line_length then
			line_ecol = line_length
		end

		local line = vim.api.nvim_buf_get_text(0, i, sel_scol - 1, i, line_ecol, {})
		print(line[1])
		-- local newText = { "hi" }
		-- vim.api.nvim_buf_set_text(0, i, cscol - 1, i, cecol, newText)
	end
end
