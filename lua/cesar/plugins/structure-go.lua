local structrue_status, structrue = pcall(require, "structrue-go")
if not structrue_status then
	return
end

structrue.setup({
	fold_open_icon = " ",
	fold_close_icon = " ",
	symbol = { -- symbol style
		filename = {
			hl = "guifg=#0096C7", -- highlight symbol
			icon = " ", -- symbol icon
		},
		package = {
			hl = "guifg=#0096C7",
			icon = " ",
		},
		import = {
			hl = "guifg=#0096C7",
			icon = " ◈ ",
		},
		const = {
			hl = "guifg=#ffa9ae",
			icon = " π ",
		},
		variable = {
			hl = "guifg=#52A5A2",
			icon = " ◈ ",
		},
		func = {
			hl = "guifg=#ffd5ac",
			icon = " 󰆥 ",
		},
		interface = {
			hl = "guifg=#78b1ff",
			icon = " ",
		},
		type = {
			hl = "guifg=#00B4D8",
			icon = "▱ ",
		},
		struct = {
			hl = "guifg=#73a9f5",
			icon = "❏ ",
		},
		field = {
			hl = "guifg=#acafff",
			icon = " ▪ ",
		},
		method_current = {
			hl = "guifg=#ffd5ac",
			icon = " 󰋋 ",
		},
		method_others = {
			hl = "guifg=#ffd5ac",
			icon = " 󰆥 ",
		},
	},
})
