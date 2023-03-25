local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

local parser_status, treesitter_parser = pcall(require, "nvim-treesitter.parsers")
if not parser_status then
	return
end

treesitter_parser.get_parser_configs().markdown = {
	install_info = {
		url = "https://github.com/MDeiml/tree-sitter-markdown",
		files = { "src/parser.c", "src/scanner.cc" },
	},
	filetype = "markdown",
}

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	ignore_install = { "sql" },
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
		"markdown_inline",
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
