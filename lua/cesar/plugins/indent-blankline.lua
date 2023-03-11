local indent_status, indent = pcall(require, "indent_blankline")
if not indent_status then
	return
end

local opt = vim.opt

opt.list = true
opt.listchars:append("space:⋅")
-- opt.listchars:append("eol:↴")

indent.setup({
	show_end_of_line = true,
	space_char_blankline = " ",
	show_current_context_start = true,
	show_current_context = true,
	use_treesitter = true,
	char = "⋅",
})
