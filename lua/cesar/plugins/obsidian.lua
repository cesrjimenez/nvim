local obsidian_status, obsidian = pcall(require, "obsidian")
if not obsidian_status then
	return
end

obsidian.setup({
	dir = "~/Documents/Obsidian/Numbers88s/",
	completion = {
		nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
	},
})
