--[[
-- TODO: redo with better functions and nvim 0.7 stuff
--]]
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost packer.lua source <afile> | PackerInstall
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself

	use({ "lewis6991/impatient.nvim" })
	use({ "nathom/filetype.nvim" })
	use({ "dstein64/vim-startuptime" })

	use({ "wakatime/vim-wakatime" })

	use({ "nvim-lua/plenary.nvim" })
	use("kyazdani42/nvim-web-devicons")
	use({ "norcalli/nvim-colorizer.lua" })

	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	use({
		"akinsho/bufferline.nvim",
		requires = { { "kyazdani42/nvim-web-devicons" } },
	})

	use({ "lewis6991/gitsigns.nvim" })

	use("kyazdani42/nvim-tree.lua")
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("akinsho/toggleterm.nvim")

	use({ "windwp/nvim-autopairs" })
	-- use({ "terrortylor/nvim-comment" })
	use({ "numToStr/Comment.nvim" })

	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "nvim-treesitter/playground", requires = { { "nvim-treesitter/nvim-treesitter" } } })
	use({ "nvim-treesitter/nvim-treesitter-context", requires = { { "nvim-treesitter/nvim-treesitter" } } })

	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer

	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- use("L3MON4D3/LuaSnip")
	-- use("rafamadriz/friendly-snippets")

	use({
		"SirVer/ultisnips",
		requires = { { "honza/vim-snippets", rtp = "." } },
		config = function()
			vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
			vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
			vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
			vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
			vim.g.UltiSnipsRemoveSelectModeMappings = 0
		end,
	})

	use("quangnguyen30192/cmp-nvim-ultisnips")

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({ "tpope/vim-scriptease" })

	use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "ahmedkhalf/project.nvim" })

	use({ "kdheepak/lazygit.nvim" })

	use({ "az-monreal/smart-splits.nvim", branch = "quickfix" })
	use({ "sindrets/winshift.nvim" })

	use({ "Shatur/neovim-cmake" })
	use({ "mfussenegger/nvim-dap" })
	use({ "stevearc/dressing.nvim" })

	use({ "rcarriga/nvim-notify" })
	use({ "natecraddock/workspaces.nvim" })
	use({ "SmiteshP/nvim-gps", requites = "nvim-treesitter/nvim-treesitter" })
	use({ "ur4ltz/surround.nvim" })
	use({ "xiyaowong/nvim-transparent" })
	-- Colorshcemes

	use({ "Mofiqul/vscode.nvim" })
	use({ "tomasiser/vim-code-dark" })
	use({ "shaeinst/roshnivim-cs" })
	use({ "rafamadriz/neon" })
	use({ "marko-cerovac/material.nvim" })
	use({ "bluz71/vim-nightfly-guicolors" })
	use({ "folke/tokyonight.nvim" })
	use({ "folke/trouble.nvim" })
	use({ "ThePrimeagen/harpoon" })

	use({ "rktjmp/lush.nvim" })

	use({ "nickeb96/fish.vim" })

	-- watson https://github.com/ccchapman/watson.nvim
end)
