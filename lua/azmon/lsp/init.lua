local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("azmon.lsp.handlers").setup()
require("azmon.lsp.lsp-installer")
-- require("azmon.lsp.null-ls")
