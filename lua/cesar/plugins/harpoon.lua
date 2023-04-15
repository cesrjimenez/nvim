local harpoon_status, harpoon = pcall(require, "harpoon")
if not harpoon_status then
	return
end

local keymap = vim.keymap

keymap.set("n", "<leader>h", ":Telescope harpoon marks<CR>")
keymap.set("n", "<leader>hq", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
keymap.set("n", "<leader>hm", ":lua require('harpoon.mark').add_file()<CR>")
keymap.set("n", "1", ":lua require('harpoon.ui').nav_file(1)<CR>")
keymap.set("n", "2", ":lua require('harpoon.ui').nav_file(2)<CR>")
keymap.set("n", "3", ":lua require('harpoon.ui').nav_file(3)<CR>")
keymap.set("n", "4", ":lua require('harpoon.ui').nav_file(4)<CR>")

harpoon.setup()
