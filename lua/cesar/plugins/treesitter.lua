local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	ensure_installed = {
		"bash",
		"css",
		"dockerfile",
		"go",
		"graphql",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"python",
		"regex",
		"tsx",
		"typescript",
		"vim",
		"yaml",
		"gitignore",
	},
	auto_install = true,
})
