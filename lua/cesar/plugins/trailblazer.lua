local trailblazer_status, trailblazer = pcall(require, "trailblazer")
if not trailblazer_status then
	return
end

trailblazer.setup({
	trail_options = {
		newest_mark_symbol = " ", -- disable this mark symbol by setting its value to ""
		cursor_mark_symbol = "", -- disable this mark symbol by setting its value to ""
		next_mark_symbol = "", -- disable this mark symbol by setting its value to ""
		previous_mark_symbol = "", -- disable this mark symbol by setting its value to ""
	},
	force_mappings = {
		nv = {
			motions = {
				new_trail_mark = "<leader>ma",
				track_back = "<leader>mb",
				peek_move_next_down = "<leader>mm",
				peek_move_previous_up = "<leader>mM",
				move_to_nearest = "<leader>mc",
			},
		},
	},
})
