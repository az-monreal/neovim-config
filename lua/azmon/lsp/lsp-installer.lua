--[[
-- TODO: on_server_ready() is deprecated, switch to setup() and do server config directly with lsp-config (see documentation)
--]]
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("azmon.lsp.handlers").on_attach,
		capabilities = require("azmon.lsp.handlers").capabilities,
	}

	if server.name == "sumneko_lua" then
		local sumneko_opt = require("azmon.lsp.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opt, opts)
	end

	-- (optional) Customize the options passed to the server
	-- if server.name == "tsserver" then
	--     opts.root_dir = function() ... end
	-- end

	-- This setup() function will take the provided server configuration and decorate it with the necessary properties
	-- before passing it onwards to lspconfig.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
