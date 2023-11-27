local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

-- true if packer was just installed
local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup({
	function(use)
		use("wbthomason/packer.nvim") -- packer itself

		-- lua functions that many plugins use
		use("nvim-lua/plenary.nvim")

		use("bluz71/vim-nightfly-guicolors")
		use("Mofiqul/vscode.nvim")
		use({ "catppuccin/nvim", as = "catppuccin" }) -- preferred colorscheme

		-- tmux & split window navigation
		use("christoomey/vim-tmux-navigator")

		use("szw/vim-maximizer") -- maximizes and restores current window

		-- essential plugins
		use("tpope/vim-surround")
		use("vim-scripts/ReplaceWithRegister")

		-- commenting with gc
		use("numToStr/Comment.nvim")

		-- file explorer
		use("nvim-tree/nvim-web-devicons")
		use({
			"yamatsum/nvim-nonicons",
			requires = { "kyazdani42/nvim-web-devicons" },
		})
		use({ "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" })

		-- statusline
		use("nvim-lualine/lualine.nvim")

		-- telescope & fuzzy fiding
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				{ "nvim-telescope/telescope-live-grep-args.nvim" },
			},
			branch = "0.1.x",
		})
		use({
			"nvim-telescope/telescope-file-browser.nvim",
			requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		})
		use({ "nvim-telescope/telescope-ui-select.nvim" })

		-- autocompletion
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("saadparwaiz1/cmp_luasnip")

		-- snippets
		use("L3MON4D3/LuaSnip")
		use("rafamadriz/friendly-snippets")

		-- managing & installing lsp servers
		use("williamboman/mason.nvim")
		use("williamboman/mason-lspconfig.nvim")

		-- configuring lsp servers
		use("neovim/nvim-lspconfig")
		use("hrsh7th/cmp-nvim-lsp")
		use({
			"glepnir/lspsaga.nvim",
			branch = "main",
			requires = {
				{ "nvim-tree/nvim-web-devicons" },
				{ "nvim-treesitter/nvim-treesitter" },
			},
		})

		-- enhanced lsp uis
		use("jose-elias-alvarez/typescript.nvim")
		use("onsails/lspkind.nvim")

		-- copilot
		use("github/copilot.vim")

		-- formatting & linting
		use("jose-elias-alvarez/null-ls.nvim")
		use("jayp0521/mason-null-ls.nvim")

		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				require("nvim-treesitter.install").update({ with_sync = true })
			end,
		})
		use("nvim-treesitter/nvim-treesitter-context")

		-- auto closing
		use("windwp/nvim-autopairs")
		use("windwp/nvim-ts-autotag")

		-- git signs plugin
		use("lewis6991/gitsigns.nvim")

		-- trouble
		use({ "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" })

		-- noice ui
		use({ "folke/noice.nvim", requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } })

		-- leap
		use("ggandor/leap.nvim")

		-- nvim-cokeline
		use({ "noib3/nvim-cokeline", requires = "kyazdani42/nvim-web-devicons" })

		-- dap-go
		use("mfussenegger/nvim-dap")
		use("leoluz/nvim-dap-go")
		use("nvim-telescope/telescope-dap.nvim")
		use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
		use("theHamsta/nvim-dap-virtual-text")

		-- go
		use("ray-x/go.nvim")
		use("ray-x/guihua.lua")

		-- harpoon
		use("ThePrimeagen/harpoon")

		-- fidget
		use({ "j-hui/fidget.nvim", tag = "legacy" })

		-- structure
		use({ "crusj/structrue-go.nvim", branch = "main" })

		-- indent dots
		use("lukas-reineke/indent-blankline.nvim")

		-- lazygit
		use("kdheepak/lazygit.nvim")

		-- vim-dadbod
		use("tpope/vim-dadbod")
		use("kristijanhusak/vim-dadbod-ui")

		-- postgres
		use("mzarnitsa/psql")

		-- command center
		use({ "FeiyouG/commander.nvim", requires = { "nvim-telescope/telescope.nvim" } })

		-- dressing
		use({ "stevearc/dressing.nvim" })

		-- legendary
		use({ "mrjones2014/legendary.nvim", requires = "kkharji/sqlite.lua" })

		-- which-key
		use({
			"folke/which-key.nvim",
			config = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 1850
				require("which-key").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				})
			end,
		})

		-- hierarchy-tree-go
		use({
			"crusj/hierarchy-tree-go.nvim",
			requires = "neovim/nvim-lspconfig",
		})

		-- git blame
		use("f-person/git-blame.nvim")

		-- close buffer
		use("mhinz/vim-sayonara")

		-- go test
		use({ "vim-test/vim-test" })

		-- marks
		use("chentoast/marks.nvim")

		-- Chat GPT3
		use({
			"jackMort/ChatGPT.nvim",
			requires = {
				"MunifTanjim/nui.nvim",
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope.nvim",
			},
		})

		-- Obsidian
		use({
			"epwalsh/obsidian.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope.nvim",
				"hrsh7th/nvim-cmp",
				"preservim/vim-markdown",
				"godlygeek/tabular",
			},
		})

		-- smart column
		use("m4xshen/smartcolumn.nvim")

		-- octo
		use({
			"pwntester/octo.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope.nvim",
				"kyazdani42/nvim-web-devicons",
			},
			config = function()
				require("octo").setup()
			end,
		})

		-- Diffview
		use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

		-- Drop (screensaver)
		use({
			"folke/drop.nvim",
			event = "VimEnter",
			config = function()
				require("drop").setup({ theme = "leaves", max = 10, interval = 150 })
			end,
		})

		-- scrollbar
		use("kevinhwang91/nvim-hlslens")
		use("petertriho/nvim-scrollbar")

		-- veil
		use({
			"willothy/veil.nvim",
			event = "VimEnter",
			requires = {
				"nvim-telescope/telescope.nvim",
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-file-browser.nvim",
			},
		})

		-- todo-comments
		use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })

		-- LSP fuzzy
		use({
			"ojroques/nvim-lspfuzzy",
			requires = {
				{ "junegunn/fzf" },
				{ "junegunn/fzf.vim" }, -- to enable preview (optional)
			},
		})

		-- alpha dashboard
		use({
			"goolord/alpha-nvim",
			requires = { "nvim-tree/nvim-web-devicons" },
			config = function()
				require("alpha").setup(require("alpha.themes.startify").config)
			end,
		})

		-- better escape
		use({
			"max397574/better-escape.nvim",
			config = function()
				require("better_escape").setup()
			end,
		})

		-- zero (improved 0 & ^)
		use("yuki-yano/zero.nvim")

		-- yanks
		use("gbprod/cutlass.nvim")

		-- vim-kitty
		use("fladson/vim-kitty")

		-- rust
		use("simrat39/rust-tools.nvim")

		-- project
		use("ahmedkhalf/project.nvim")

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		max_jobs = 20,
	},
})
