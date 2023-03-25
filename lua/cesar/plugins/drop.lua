local drop_status, drop = pcall(require, "drop")
if not drop_status then
	return
end

drop.setup({
	screensaver = 10,
})
