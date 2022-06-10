local opts = { noremap = true, silent = true }

local function values(t)
	local i = 0
	return function()
		i = i + 1
		return t[i]
	end
end

local keymaps = {
	{ { "n" }, "v", "V" }, -- switch visual and visual line modes
	{ { "n" }, "V", "v" },

	{ { "n" }, "Y", "y$" },

	{ { "v" }, "y", "ygv" }, -- reselect after yank on visual modes

	{ { "n" }, "<leader>`", "viwU", opts },

	{ { "n" }, "<C-s>", ":w<CR>", opts },
	{ { "n" }, "<C-s>a", ":wa<CR>", opts },

	{ { "n", "t" }, "<leader>H", ":BufferLineMovePrev<CR>", opts },
	{ { "n", "t" }, "<leader>L", ":BufferLineMoveNext<CR>", opts },

	{ { "n" }, "<S-Tab>", ":BufferLineCyclePrev<CR>", opts },
	{ { "n" }, "<Tab>", ":BufferLineCycleNext<CR>", opts },

	{ { "n", "t" }, "<leader><Tab>", "gt", opts },
	{ { "n", "t" }, "<leader><S-Tab>", "gT", opts },

	{ { "n" }, ">>", "m'>>`'l" },
	{ { "n" }, "<<", "m'<<`'h" },
	{ { "v" }, ">>", ">gvl" },
	{ { "v" }, "<<", "<gvh" },

	{ { "n" }, "<M-f>", ":NvimTreeToggle<CR>", opts },

	{ { "n" }, "<leader>f", ":Telescope<CR>", opts },
	{ { "n" }, "<leader>ff", ":Telescope find_files<CR>", opts },
	{ { "n" }, "<leader>ft", ":Telescope grep_string<CR>", opts },
	{ { "n" }, "<leader>fh", ":Telescope help_tags theme=dropdown<CR>", opts },
	{ { "n" }, "<leader>fp", ":Telescope projects theme=dropdown<CR>", opts },
	{ { "n" }, "<leader>ft", ":TodoTelescope<CR>", opts },

	{ { "n" }, "<leader>qq", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts },
	{ { "n" }, "<leader>qh", ':lua require("harpoon.ui").nav_file(1)<CR>', opts },
	{ { "n" }, "<leader>qj", ':lua require("harpoon.ui").nav_file(2)<CR>', opts },
	{ { "n" }, "<leader>qk", ':lua require("harpoon.ui").nav_file(3)<CR>', opts },
	{ { "n" }, "<leader>ql", ':lua require("harpoon.ui").nav_file(4)<CR>', opts },

	{ { "n" }, "<leader><leader>wm", ":WinShift<CR>", opts },
	{ { "n" }, "<leader><leader>ws", ":SmartResizeMode<CR>", opts },

	-- { { "n" }, "<M-h>", "<C-w>h" },
	-- { { "n" }, "<M-j>", "<C-w>j" },
	-- { { "n" }, "<M-k>", "<C-w>k" },
	-- { { "n" }, "<M-l>", "<C-w>l" },

	{ { "n", "v" }, "<F12>", ":ToggleTerm direction=vertical<CR>" },
	--nnoremap <leader>` viwU
}

for _, v in pairs(keymaps) do
	vim.keymap.set(unpack(v))
end

local normal = {
	{ "ZZ", ":wa|qa<CR>", opts }, -- quick exiting
	{ "Zz", ":w|bd<CR>", opts },
	{ "ZQ", ":qa!<CR>", opts },
	{ "Zq", ":bd!<CR>", opts },
	-- TODO:make it not close split

	{ "\\v", ":vsplit<CR>", opts },
	{ "\\h", ":split<CR>", opts },
	{ "\\q", ":close<CR>", opts },
}

for v in values(normal) do
	vim.keymap.set("n", unpack(v))
end

-- for k, v in pairs(normal) do
-- 	vim.keymap.set('n', unpack(v))
-- end

--[[
vim.keymap.set('n', 'v', 'V')
vim.keymap.set('n', 'V', 'v')

nnoreap v V
nnoreap V v
--]]
--
