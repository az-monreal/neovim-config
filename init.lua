-- vim.notify = require("notify")

local modules = {
	"options",
	"packer",
	"plugins",
	"keymaps",
	"autocommands",
	"lsp",
}

for _, v in pairs(modules) do
	local status, error = pcall(require, "azmon." .. v)
	if not status then
		vim.schedule(function()
			require("notify")(v .. "(azmon." .. v .. ") could not be laoded\n" .. error, "error", {
				title = "Error Loading Module",
			})
		end)
	end
end
--[[ require("azmon.options")
require("azmon.packer")
require("azmon.plugins")
require("azmon.keymaps")
require("azmon.autocommands")
require("azmon.lsp") ]]
