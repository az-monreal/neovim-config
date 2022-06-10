local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local function linenum()
	return vim.fn.line("$")
	-- return vim.fn.cursor('.', '.')
end

local _, gps = pcall(require, "nvim-gps")

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		-- theme = "vscode",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		-- lualine_c = { "filename" },
		lualine_c = { "filename", { gps.get_location, cond = gps.is_available } },
		-- lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_x = { "filetype" },
		lualine_y = { "progress" },
		-- lualine_z = {'location'},
		lualine_z = { "%l/%L", "%c" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	--tabline = {
	--	lualine_a = {'buffers'},
	--	lualine_b = {'branch'},
	--	lualine_c = {},
	--	lualine_x = {},
	--	lualine_y = {},
	--	lualine_z = {'tabs'}
	--},
	extensions = { "nvim-tree", "quickfix", "toggleterm" },
})
