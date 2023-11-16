local indent_status, indent = pcall(require, "ibl")
if not indent_status then
	return
end

-- local opt = vim.opt

-- opt.list = true
-- opt.listchars:append("space:⋅")
-- opt.listchars:append("eol:↴")

indent.setup({
	-- show_end = true,
	-- space_char_blankline = " ",
	-- show_current_context_start = true,
	-- show_current_context = true,
	-- use_treesitter = true,
	-- char = "⋅",
})
