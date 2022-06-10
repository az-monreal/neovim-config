local status_ok, smart_splits = pcall(require, "smart-splits")
if not status_ok then
	return
end

smart_splits.setup({
	-- Ignored filetypes (only while resizing)
	ignored_filetypes = {
		"nofile",
		"quickfix",
		"prompt",
	},
	-- Ignored buffer types (only while resizing)
	ignored_buftypes = { "NvimTree" },
	-- when moving cursor between splits left or right,
	-- place the cursor on the same row of the *screen*
	-- regardless of line numbers. False by default.
	-- Can be overridden via function parameter, see Usage.
	move_cursor_same_row = false,
})

-- recommended mappings
-- -- resizing splits
vim.keymap.set("n", "<leader><M-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<leader><M-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<leader><M-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<leader><M-l>", require("smart-splits").resize_right)
-- -- moving between splits
vim.keymap.set("n", "<M-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<M-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<M-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<M-l>", require("smart-splits").move_cursor_right)
