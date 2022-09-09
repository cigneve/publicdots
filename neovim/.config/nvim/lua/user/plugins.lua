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
    autocmd BufWritePost plugins.lua source <afile>
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
return packer.startup(function(use)
	-- My plugins here

	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs", config = [[require('config.autopairs')]] }) -- Autopairs, integrates with both cmp and treesitter
	use({
		"numToStr/Comment.nvim",
		config = [[require('config.comment')]],
		module = { "Comment", "Comment.api" },
		keys = { "gc", "gb", "g<", "g>" },
	})
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua", config = [[require('config.nvim-tree')]] })
	use({ "akinsho/bufferline.nvim", config = [[require('config.bufferline')]] })
	use({ "moll/vim-bbye" })
	use({ "nvim-lualine/lualine.nvim", config = [[require('config.lualine')]] })
	use({ "akinsho/toggleterm.nvim", config = [[require('config.toggleterm')]] })
	use({ "ahmedkhalf/project.nvim", config = [[require('config.project')]] })
	use({ "lewis6991/impatient.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim", config = [[require('config.indentline')]] })
	use({ "goolord/alpha-nvim", config = [[require('config.alpha')]] })

	-- Colorschemes
	use({ "rose-pine/neovim" })
	use({ "sainnhe/gruvbox-material" })
	use({ "rebelot/kanagawa.nvim" })

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			"hrsh7th/cmp-nvim-lsp",
			{ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			"lukas-reineke/cmp-under-comparator",
			{ "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
		},
		config = [[require('config.cmp')]],
		event = "InsertEnter",
		after = "LuaSnip",
	})
	-- snippets
	use({ "L3MON4D3/LuaSnip", event = "InsertEnter" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
	use({ "williamboman/mason.nvim" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim", after = { "mason.nvim" } })
	use({ "neovim/nvim-lspconfig" }) -- enable LSP

	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "RRethy/vim-illuminate", config = [[require('config.illuminate')]] })

	-- Telescope
	-- Search
	use({
		{
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-lua/popup.nvim",
				"nvim-lua/plenary.nvim",
				"telescope-frecency.nvim",
				"telescope-fzf-native.nvim",
				"nvim-telescope/telescope-ui-select.nvim",
			},
			wants = {
				"popup.nvim",
				"plenary.nvim",
				"telescope-frecency.nvim",
				"telescope-fzf-native.nvim",
			},
			--setup = [[require('config.telescope_setup')]],
			cmd = "Telescope",
			config = [[require('config.telescope')]],
			module = "telescope",
		},
		{
			"nvim-telescope/telescope-frecency.nvim",
			after = "telescope.nvim",
			requires = "tami5/sqlite.lua",
		},
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
		},
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		config = [[require('config.treesitter')]],
	})
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })

	-- Git
	use({ "lewis6991/gitsigns.nvim", config = [[require('config.gitsigns')]] })

	-- DAP
	use({ "mfussenegger/nvim-dap", config = [[require('config.dap')]] })
	use({ "rcarriga/nvim-dap-ui" })

	-- Competitive programming helper
	use({
		"xeluxee/competitest.nvim",
		requires = "MunifTanjim/nui.nvim",
		config = [[require('config.competitest')]],
	})

	use({ "mhinz/vim-sayonara" })
	use("b0o/incline.nvim")
	-- Movement plugin
	use({
		"ggandor/leap.nvim",
		requires = "tpope/vim-repeat",
		config = [[require('config.leap')]],
	})
	-- Latex
	use("lervag/vimtex")
	use("barreiroleo/ltex_extra.nvim")
	-- Profiling
	use({ "dstein64/vim-startuptime", cmd = "StartupTime", config = [[vim.g.startuptime_tries = 10]] })

	-- EWW support
	use("elkowar/yuck.vim")

	-- Colorizer
	use({ "norcalli/nvim-colorizer.lua", config = [[require('colorizer').setup()]] })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
