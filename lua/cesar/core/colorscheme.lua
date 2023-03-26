local catppuccin_status, catppuccin = pcall(require, "catppuccin")
if not catppuccin_status then
	print("Catppuccin not found!")
	return
end

catppuccin.setup({
	integrations = {
		gitsigns = true,
		nvimtree = false,
		telescope = false,
		notify = true,
		lsp_trouble = false,
		harpoon = true,
	},
})

local status, _ = pcall(vim.cmd, "colorscheme catppuccin-mocha")
if not status then
	print("Colorscheme not found!")
	return
end

-- vim.o.termguicolors = true
