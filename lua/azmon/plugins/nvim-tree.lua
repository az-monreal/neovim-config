-- default mappings
local list = {
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	{ key = "<C-e>", action = "edit_in_place" },
	{ key = { "O" }, action = "edit_no_picker" },
	{ key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
	{ key = "<C-v>", action = "vsplit" },
	{ key = "<C-x>", action = "split" },
	{ key = "<C-t>", action = "tabnew" },
	{ key = "<", action = "prev_sibling" },
	{ key = ">", action = "next_sibling" },
	{ key = "P", action = "parent_node" },
	{ key = "<BS>", action = "close_node" },
	{ key = "<Tab>", action = "preview" },
	{ key = "K", action = "first_sibling" },
	{ key = "J", action = "last_sibling" },
	{ key = "I", action = "toggle_git_ignored" },
	{ key = "H", action = "toggle_dotfiles" },
	{ key = "R", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "D", action = "trash" },
	{ key = "r", action = "rename" },
	{ key = "<C-r>", action = "full_rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "y", action = "copy_name" },
	{ key = "Y", action = "copy_path" },
	{ key = "gy", action = "copy_absolute_path" },
	{ key = "[c", action = "prev_git_item" },
	{ key = "]c", action = "next_git_item" },
	{ key = "-", action = "dir_up" },
	{ key = "s", action = "system_open" },
	{ key = { "q", "<Esc>" }, action = "close" },
	{ key = "?", action = "toggle_help" },
	{ key = "W", action = "collapse_all" },
	{ key = "S", action = "search_node" },
	{ key = "<C-k>", action = "toggle_file_info" },
	{ key = ".", action = "run_file_command" },
}

local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

nvimtree.setup({ -- BEGIN_DEFAULT_OPTS
	auto_reload_on_write = true,
	disable_netrw = true,
	create_in_closed_folder = true,
	respect_buf_cwd = true,
	-- hide_root_folder = false,
	hijack_cursor = true,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = true,
	ignore_buffer_on_setup = false,
	open_on_setup = false,
	open_on_setup_file = false,
	open_on_tab = true,
	sort_by = "name",
	update_cwd = true,
	view = {
		width = 30,
		height = 30,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = list,
		},
	},
	renderer = {
		highlight_opened_files = "none",
		indent_markers = {
			enable = true,
			icons = {
				corner = "??? ",
				edge = "??? ",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
		},
		-- glyphs = {
		-- 	default = "???",
		-- 	symlink = "???",
		-- 	git = {
		-- 		unstaged = "???",
		-- 		staged = "S",
		-- 		unmerged = "???",
		-- 		renamed = "???",
		-- 		deleted = "???",
		-- 		untracked = "U",
		-- 		ignored = "???",
		-- 	},
		-- 	folder = {
		-- 		arrow_open = "???",
		-- 		arrow_closed = "???",
		-- 		default = "???",
		-- 		open = "???",
		-- 		empty = "???",
		-- 		empty_open = "???",
		-- 		symlink = "???",
		-- 		symlink_open = "???",
		-- 	},
		-- 	lsp = {
		-- 		hint = "???",
		-- 		info = "???",
		-- 		warning = "???",
		-- 		error = "???",
		-- 	},
		-- },
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = { "help" },
	},
	ignore_ft_on_setup = {},
	system_open = {
		cmd = nil,
		args = {},
	},
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		icons = {
			hint = "???",
			info = "???",
			warning = "???",
			error = "???",
		},
	},
	filters = {
		dotfiles = false,
		custom = {},
		exclude = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 400,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
		},
		open_file = {
			quit_on_open = true,
			resize_window = true,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			diagnostics = false,
			git = false,
			profile = false,
		},
	},
}) -- END_DEFAULT_OPTS

-- vim.api.nvim_create_autocmd("BufEnter", {pattern ="*", command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif", nested = true})
--
