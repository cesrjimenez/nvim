local smartcolumn_status, smartcolumn = pcall(require, "smartcolumn")
if not smartcolumn_status then
	return
end

smartcolumn.setup({
	colorcolumn = "100",
	custom_colorcolumn = {
		go = "120",
	},
})
