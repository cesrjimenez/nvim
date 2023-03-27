local smartcolumn_status, smartcolumn = pcall(require, "smartcolumn")
if not smartcolumn_status then
	return
end

smartcolumn.setup({
	colorcolumn = "200",
	custom_colorcolumn = {
		go = "200",
		typescript = "200",
		javascript = "200",
		javascriptreact = "200",
	},
})
