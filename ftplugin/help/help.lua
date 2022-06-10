-- autocmd BufWinEnter <buffer> wincmd L
-- map <buffer> <Esc> :q<CR>

local opts = { noremap = true, silent = true, buffer = true }

local keymaps = {
	-- {{''},'','', opts},
	{ { "" }, "<Esc>", ":q<CR>", opts },
}

for _, v in pairs(keymaps) do
	vim.keymap.set(unpack(v))
end

--[[ local commands = {
	"setlocal",
}
for _, v in pairs(commands) do
	vim.cmd(v)
end ]]

local autocmds = {
	{ "", { pattern = "", command = "" } },
}

vim.api.nvim_create_autocmd("BufWinEnter", { buffer = 0, command = "wincmd L" })
