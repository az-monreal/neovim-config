local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- c/c++
		-- formatting.clang_format,
		-- diagnostics.cppcheck,

		-- lua
		formatting.stylua,
		diagnostics.luacheck.with({ args = { "--globals" } }),
	},
	-- on_attach = function(client)
	-- 		--vim.api.nvim_create_autocmd("BufWritePre", {buffer = 0, callback = "vim.lsp.buf.formatting_sync()"})
	--     if client.resolved_capabilities.document_formatting then
	--         vim.cmd([[
	--         augroup LspFormatting
	--             autocmd! * <buffer>
	--             autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
	--         augroup END
	--         ]])
	--     end
	-- end,
})
