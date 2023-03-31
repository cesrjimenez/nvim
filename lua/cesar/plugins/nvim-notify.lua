local notify_status, notify = pcall(require, "notify")
if not notify_status then
	return
end

local nonicons_extention = require("nvim-nonicons.extentions.nvim-notify")
notify.setup({
	icons = nonicons_extention.icons,
})
