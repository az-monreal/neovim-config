--------------------------------------------------------------------------------

local options = {
	cmdheight = 0,
	updatetime = 500,
	mouse = "a",

	wrap = false,
	-- autoindent = true,
	tabstop = 4,
	expandtab = false,
	shiftwidth = 4,

	-- foldmethod = "syntax",

	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	-- foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]],
	foldtext = "getline(v:foldstart).'...'.trim(getline(v:foldend))",

	fillchars = "fold: ",
	foldnestmax = 3,
	foldminlines = 1,
	foldlevel = 4,

	relativenumber = true,
	number = true,
	signcolumn = "yes:1",
	showmode = false,

	termguicolors = true,

	hlsearch = false,
	--wildmenu = true,
	-- wildmode = full,
	ignorecase = true,
	smartcase = true,
	pumheight = 10,

	splitright = true,
	splitbelow = true,

	list = true,
	-- listchars = { eol = "⤶", space = "❤", trail = "✚", extends = "◀", precedes = "▶" },
	listchars = {
		eol = "↲",
		tab = "  ",
		-- tab = "» ",
		extends = ">",
		-- precedes = "<",
		conceal = "┊",
		nbsp = "␣",
	},

	scrolloff = 10,

	--[[
	-- call cyclist#add_listchar_option_set('limited', {
	-- \ 'eol': '↲',
	-- \ 'tab': '» ',
	-- \ 'trail': '·',
	-- \ 'extends': '<',
	-- \ 'precedes': '>',    
	-- \ 'conceal': '┊',
	-- \ 'nbsp': '␣',
	-- \ })
	--
	-- call cyclist#add_listchar_option_set('busy', {
	-- \ 'eol': '↲',
	-- \ 'tab': '»·',
	-- \ 'space': '␣',
	-- \ 'trail': '-',
	-- \ 'extends': '☛',
	-- \ 'precedes': '☚',    
	-- \ 'conceal': '┊',
	-- \ 'nbsp': '☠',
	-- \ })
	--
	--]]
}

vim.opt.shortmess:append("c")

-- filnxtTo0Fc

for k, v in pairs(options) do
	vim.opt[k] = v
end

--------------------------------------------------------------------------------

local rmoptions = {
	-- wildoptions = "pum",
}

for k, v in pairs(rmoptions) do
	vim.opt[k]:remove({ v })
end

--------------------------------------------------------------------------------

local variables = {
	mapleader = " ",

	vscode_style = "dark",
	vscode_transparency = 1,
	vscode_italic_comment = 1,
	vscode_disable_nvimtree_bg = "v:true",
}

for k, v in pairs(variables) do
	vim.g[k] = v
end

--------------------------------------------------------------------------------
--
local colorschemes = {
	"vscode",
	"codedark",
	"neon",
	"rvcs",
	"nightfly",
}

local function chooseColorScheme()
	local random = flase
	local defaultCS = "vscode"
	if not random then
		vim.schedule(function()
			require("notify")("Colorscheme set to " .. defaultCS)
		end)
		return defaultCS
	end
	math.randomseed(os.clock())
	local index = math.random(table.getn(colorschemes))
	local cs = colorschemes[index]
	-- vim.notify("Colorscheme is " .. cs)
	vim.schedule(function()
		require("notify")("Colorscheme set to " .. cs)
	end)
	return cs
end

local commands = {
	"colorscheme " .. chooseColorScheme(),
}
for _, v in pairs(commands) do
	vim.cmd(v)
end

vim.cmd([[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({timeout=700})
augroup END
]])
