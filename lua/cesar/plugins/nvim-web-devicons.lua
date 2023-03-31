local icons = require("nvim-nonicons")
require("nvim-web-devicons").set_icon({
	go = {
		icon = icons.get("go"),
		color = "#519aba",
		cterm_color = "74",
		name = "Go",
	},
	md = {
		icon = icons.get("markdown"),
		color = "#ffffff",
		cterm_color = "231",
		name = "Md",
	},
})
