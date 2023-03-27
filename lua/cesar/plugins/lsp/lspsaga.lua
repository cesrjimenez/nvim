-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	-- keybinds for navigation in lspsaga window
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	-- use enter to open file with definition preview
	definition = {
		edit = "<CR>",
	},
	ui = {
		-- This option only works in Neovim 0.9
		-- Border type can be single, double, rounded, solid, shadow.
		border = "single",
		winblend = 0,
		expand = "",
		collapse = "",
		code_action = "💡",
		incoming = " ",
		outgoing = " ",
		hover = " ",
		kind = {},
		colors = {
			normal_bg = "#022746",
		},
	},
	symbol_in_winbar = {
		enable = false,
	},
	finder = {
		keys = {
			tabe = "<CR>",
		},
	},
	outline = {
		win_position = "right",
		win_with = "",
		win_width = 60,
		show_detail = true,
		auto_preview = true,
		auto_refresh = true,
		auto_close = true,
		custom_sort = nil,
		keys = {
			jump = "<CR>",
			expand_collapse = "<Tab>",
			quit = "q",
		},
	},
})
