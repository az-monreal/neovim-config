--[[
-- local status_ok, name = pcall(require, "")
-- if not status_ok then
-- 	return
-- end
--]]
local plugins = {
	"impatient",
	-- "filetype",
	"lualine",
	"nvim-tree",
	"toggleterm",
	-- "cmp-luasnip",
	"cmp-ultisnips",
	"autopairs",
	"telescope",
	"bufferline",
	-- "nvim-comment",
	"comment",
	"gitsigns",
	"treesitter",
	"colorizer",
	"ultisnips",
	"todo",
	"project",
	"smart-splits",
	"winshift",
	"cmake",
	"dressing",
	"notify",
	-- "workspaces",
	-- "gps",
	"surround",
	"transparent",
	"trouble",
	"harpoon",
}

for _, v in pairs(plugins) do
	local status_ok, _ = pcall(require, ... .. "." .. v)
	if not status_ok then
		require("notify")(v .. "(" .. ... .. "." .. v .. ") could not be laoded", "error")
	end
end
