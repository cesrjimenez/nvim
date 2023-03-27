local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

telescope.setup({
	defaults = {
		layout_config = {
			height = 0.75,
		},
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
	},
	pickers = {
		current_buffer_fuzzy_find = {
			theme = "ivy",
		},
		buffers = {
			theme = "dropdown",
		},
		file_browser = {
			theme = "dropdown",
		},
	},
})

-- telescope-file-browser
-- vim.api.nvim_set_keymap("n", "<space>fb", ":Telescope file_browser<CR>", { noremap = true })

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
	"n",
	"<space>fb",
	":Telescope file_browser path=%:p:h select_buffer=true theme=dropdown<CR>",
	{ noremap = true }
)

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("dap")
telescope.load_extension("ui-select")
