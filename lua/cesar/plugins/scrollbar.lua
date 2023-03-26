local scrollbar_status, scrollbar = pcall(require, "scrollbar")
if not scrollbar_status then
	return
end

local scroll_hsl_status, scroll_hsl = pcall(require, "scrollbar.handlers.search")
if not scroll_hsl_status then
	return
end

local scrollbar_git_status, scrollbar_git = pcall(require, "scrollbar.handlers.gitsigns")
if not scrollbar_git_status then
	return
end

scrollbar.setup()
scroll_hsl.setup()
scrollbar_git.setup()
