function DefFromDec()
	vim.cmd(vim.api.nvim_replace_termcodes(
		[[
	startinsert!
	norm yyGo
	norm p$xo{<CR>
	]],
		true,
		true,
		true
	))
end

vim.keymap.set("n", "<leader>df", DefFromDec, { noremap = true, silent = true, buffer = true })
vim.keymap.set("n", "<F7>", "<cmd>w|!gcc '%' -o '%<'.out -lm<CR><CR>", { noremap = true, silent = true, buffer = true })
