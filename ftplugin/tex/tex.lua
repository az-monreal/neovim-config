local opts = { noremap = true, silent = true, buffer = true }

local keymaps = {
	-- {{''},'','', opts},
	{ { "n", "v" }, "j", "gj", opts },
	{ { "n", "v" }, "k", "gk", opts },
	{ { "n", "v" }, "$", "g$", opts },
	{ { "n", "v" }, "0", "g0", opts },

	{ { "n", "v" }, "gj", "j", opts },
	{ { "n", "v" }, "gk", "k", opts },
	{ { "n", "v" }, "g$", "$", opts },
	{ { "n", "v" }, "g0", "0", opts },
}

for _, v in pairs(keymaps) do
	vim.keymap.set(unpack(v))
end

--[[ local function CompileToPdf() end

vim.api.nvim_create_autocmd("BufWritePost", { buffer = 0, callback = CompileToPdf }) ]]
vim.api.nvim_create_autocmd("BufEnter", {
	buffer = 0,
	callback = function()
		vim.opt.wrap = true
		vim.opt.linebreak = true
	end,
})
vim.api.nvim_create_autocmd("BufLeave", {
	buffer = 0,
	callback = function()
		vim.opt.wrap = false
		vim.opt.linebreak = false
	end,
})
