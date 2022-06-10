-- vim.api.nvim_create_autocmd("BufWritePost", {pattern ="~/.config/nvim/*.lua", command = "source <afile>"})
vim.api.nvim_create_autocmd("BufWritePost", { pattern = "*/.config/nvim/*.lua", command = "luafile $MYVIMRC" })
-- lua package.loaded["lua path"] = nil

local format = function()
	vim.lsp.buf.formatting_sync()
end

vim.api.nvim_create_autocmd("BufWritePre", { pattern = "*", callback = format })
vim.api.nvim_create_autocmd("WinEnter", { pattern = "*/.config/nvim/colors/*.lua", command = "LspStop" })
