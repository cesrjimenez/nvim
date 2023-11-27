local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- local command_center_status, commander = pcall(require, "commander.nvim")
-- if not command_center_status then
-- 	return
-- end
local commander = require("commander")

local noremap = { noremap = true }
local silent_noremap = { noremap = true, silent = true }

commander.setup({
	integration = {
		telescope = {
			enable = true,
			theme = require("telescope.themes").commander,
		},
	},
})

-- general keymaps
commander.add({
	{
		desc = "Core: Escape insert mode",
		cmd = "<ESC>",
		keys = { "i", "js", noremap },
	},
	{
		desc = "Core: Clear search",
		cmd = ":nohl<CR>",
		keys = { "n", "<leader>nh", noremap },
	},
	{
		desc = "Core: Increment ints",
		cmd = "<C-a>",
		keys = { "n", "<leader>+", noremap },
	},
	{
		desc = "Core: Decrement ints",
		cmd = "<C-x>",
		keys = { "n", "<leader>-", noremap },
	},
	{
		desc = "Core: Find and replace",
		cmd = ":%s@",
	},
}, { show = true })

-- Window Mappings
commander.add({
	{
		desc = "Window: Split horizontal",
		cmd = "<C-w>s",
		keys = { "n", "<leader>sh", noremap },
	},
	{
		desc = "Window: Split vertical",
		cmd = "<C-w>v",
		keys = { "n", "<leader>sv", noremap },
	},
	{
		desc = "Window: Split equal width",
		cmd = "<C-w>=",
		keys = { "n", "<leader>se", noremap },
	},
	{
		desc = "Window: Close current split window",
		cmd = ":close<CR>",
		keys = { "n", "<leader>sx", noremap },
	},
	{
		desc = "Window: Maximize current window",
		cmd = ":MaximizerToggle<CR>",
		keys = { "n", "<leader>sm", noremap },
	},
})

-- Tabs and Buffers
commander.add({
	{
		desc = "Tab: Open new tab",
		cmd = ":tabnew<CR>",
		keys = { "n", "<leader>to", noremap },
	},
	{
		desc = "Tab: Close current tab",
		cmd = ":tabclose<CR>",
		keys = { "n", "<leader>tx", noremap },
	},
	{
		desc = "Tab: Next tab",
		cmd = ":tabn<CR>",
		keys = { "n", "<leader>tn", noremap },
	},
	{
		desc = "Tab: Previous tab",
		cmd = ":tabp<CR>",
		keys = { "n", "<leader>tp", noremap },
	},
})

-- Navigation
commander.add({
	{
		desc = "Directory: Open directory at current file",
		cmd = ":NvimTreeToggle<CR>",
		keys = { "n", "<leader>k", noremap },
	},
})

-- Telescope
commander.add({
	{
		desc = "Telescope: Find files",
		cmd = "<CMD>Telescope find_files<CR>",
		keys = { "n", "<leader>ff", noremap },
	},
	{
		desc = "Telescope: Find string",
		cmd = "<CMD>Telescope live_grep<CR>",
		keys = { "n", "<leader>fss", noremap },
	},
	{
		desc = "Telescope: Find string under cursor",
		cmd = "<CMD>Telescope grep_string<CR>",
		keys = { "n", "<leader>fg", noremap },
	},
	{
		desc = "Telescope: Find buffers",
		cmd = "<CMD>Telescope buffers<CR>",
		keys = { "n", "<leader>fk", noremap },
	},
	{
		desc = "Telescope: Fuzzy find current buffer",
		cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
		keys = { "n", "<leader>fh", noremap },
	},
	{
		-- If no keys are specified, no keymaps will be displayed nor set
		desc = "Telescope: Find hidden files",
		cmd = "<CMD>Telescope find_files hidden=true<CR>",
	},
	{
		desc = "Telescope: File Browser",
		cmd = "<CMD>Telescope file_browser path=%:p:h<CR>",
		keys = { "n", "<leader>fb", noremap },
	},
})

-- Command Center w/ Telescope
commander.add({
	{
		desc = "Telescope: Open command_center",
		-- cmd = "<CMD>Telescope commander<CR>",
		cmd = "<CMD>lua require('commander').show()<CR>",
		keys = {
			--	{ "<leader>f", "<CMD>Telescope commander<CR>", mode = "n" },
			{ "n", "<Leader>fc", noremap },
			{ "v", "<Leader>fc", noremap },
			-- If ever hesitate when using telescope start with <leader>f,
			-- also open command center
			{ "n", "<Leader>f", noremap },
			{ "v", "<Leader>f", noremap },
		},
	},
})

-- Trouble
commander.add({
	{
		desc = "Trouble: Open trouble window",
		cmd = "<CMD>TroubleToggle<CR>",
		keys = { "n", "<Leader>=", silent_noremap },
	},
	{
		desc = "Trouble: Open workspace diagnostics",
		cmd = "<CMD>TroubleToggle workspace_diagnostics<CR>",
		keys = { "n", "<Leader>=w", silent_noremap },
	},
	{
		desc = "Trouble: Open document diagnostics",
		cmd = "<CMD>TroubleToggle document_diagnostics<CR>",
		keys = { "n", "<Leader>=d", silent_noremap },
	},
	{
		desc = "Trouble: Open loclist",
		cmd = "<CMD>TroubleToggle loclist<CR>",
		keys = { "n", "<Leader>=l", silent_noremap },
	},
	{
		desc = "Trouble: Open quickfix",
		cmd = "<CMD>TroubleToggle quickfix<CR>",
		keys = { "n", "<Leader>=q", silent_noremap },
	},
	{
		desc = "Trouble: Open lsp_references",
		cmd = "<CMD>TroubleToggle lsp_references<CR>",
		keys = { "n", "<Leader>=r", silent_noremap },
	},
})

-- DAP Debugging
commander.add({
	{
		desc = "Debug: Start debugging",
		cmd = "<CMD>lua require('dap').continue()<CR>",
		keys = { "n", "<F5>", silent_noremap },
	},
	{
		desc = "Debug: Step over",
		cmd = "<CMD>lua require('dap').step_over()<CR>",
		keys = { "n", "<F8>", silent_noremap },
	},
	{
		desc = "Debug: Step into",
		cmd = "<CMD>lua require('dap').step_into()<CR>",
		keys = { "n", "<F9>", silent_noremap },
	},
	{
		desc = "Debug: Step out",
		cmd = "<CMD>lua require('dap').step_out()<CR>",
		keys = { "n", "<F7>", silent_noremap },
	},
	{
		desc = "Debug: Toggle breakpoint",
		cmd = "<CMD>lua require('dap').toggle_breakpoint()<CR>",
		keys = { "n", "<F6>", silent_noremap },
	},
})

-- Harpoon
commander.add({
	{
		desc = "Harpoon: Toggle harpoon (telescope)",
		cmd = ":Telescope harpoon marks<CR>",
		keys = { "n", "<Leader>h", silent_noremap },
	},
	{
		desc = "Harpoon: Toggle harpoon quick menu",
		cmd = "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>",
		keys = { "n", "<Leader>hq", silent_noremap },
	},
	{
		desc = "Harpoon: Add file to harpoon",
		cmd = "<CMD>lua require('harpoon.mark').add_file()<CR>",
		keys = { "n", "<Leader>ha", silent_noremap },
	},
	{
		desc = "Harpoon: Navigate to file 1",
		cmd = "<CMD>lua require('harpoon.ui').nav_file(1)<CR>",
		keys = { "n", "1", silent_noremap },
	},
	{
		desc = "Harpoon: Navigate to file 2",
		cmd = "<CMD>lua require('harpoon.ui').nav_file(2)<CR>",
		keys = { "n", "2", silent_noremap },
	},
	{
		desc = "Harpoon: Navigate to file 3",
		cmd = "<CMD>lua require('harpoon.ui').nav_file(3)<CR>",
		keys = { "n", "3", silent_noremap },
	},
	{
		desc = "Harpoon: Navigate to file 4",
		cmd = "<CMD>lua require('harpoon.ui').nav_file(4)<CR>",
		keys = { "n", "4", silent_noremap },
	},
})

-- Cokeline
commander.add({
	{
		desc = "Cokeline: Focus Previous",
		cmd = "<Plug>(cokeline-focus-prev)",
		keys = { "n", "<S-Tab>", silent_noremap },
	},
	{
		desc = "Cokeline: Focus Next",
		cmd = "<Plug>(cokeline-focus-next)",
		keys = { "n", "<Tab>", silent_noremap },
	},
	{
		desc = "Cokeline: Switch Previous",
		cmd = "<Plug>(cokeline-switch-prev)",
		keys = { "n", "<Leader>p", silent_noremap },
	},
	{
		desc = "Cokeline: Switch Next",
		cmd = "<Plug>(cokeline-switch-next)",
		keys = { "n", "<Leader>n", silent_noremap },
	},
})

-- Nvim Tree
commander.add({
	{
		desc = "Nvim Tree: Toggle Nvim Tree",
		cmd = "<CMD>NvimTreeToggle<CR>",
		keys = { "n", "<Leader>k", silent_noremap },
	},
})

-- Hierarchy Tree Go
commander.add({
	{
		desc = "Hierarchy Tree: Call incoming",
		cmd = ":lua require'hierarchy-tree-go'.incoming()",
		keys = { "n", "<leader>fi", silent_noremap },
	},
	{
		desc = "Hierarchy Tree: Call outgoing",
		cmd = ":lua require'hierarchy-tree-go'.outgoing()",
		keys = { "n", "<leader>fo", silent_noremap },
	},
	{
		desc = "Hierarchy Tree: Open hierarchy tree",
		cmd = ":lua require'hierarchy-tree-go'.open()",
		keys = { "n", "<leader>ho", silent_noremap },
	},
	{
		desc = "Hierarchy Tree: Close hierarchy tree",
		cmd = ":lua require'hierarchy-tree-go'.close()",
		keys = { "n", "<leader>hc", silent_noremap },
	},
	{
		desc = "Hierarchy Tree: Focus hierarchy tree",
		cmd = ":lua require'hierarchy-tree-go'.focus()",
		keys = { "n", "<leader>fu", silent_noremap },
	},
	{
		desc = "Hierarchy Tree: Expand hierarchy tree",
		cmd = ":lua require'hierarchy-tree-go'.expand()",
		keys = { "n", "o", silent_noremap },
	},
	{
		desc = "Hierarchy Tree: Jump to selection",
		cmd = ":lua require'hierarchy-tree-go'.jump()",
		keys = { "n", "<CR>", silent_noremap },
	},
})

-- Git Blame
commander.add({
	{
		desc = "Git Blame: Toggle git blame",
		cmd = ":GitBlameToggle<CR>",
	},
	{
		desc = "Git Blame: Enable git blame",
		cmd = ":GitBlameEnable<CR>",
	},
	{
		desc = "Git Blame: Disable git blame",
		cmd = ":GitBlameDisable<CR>",
	},
	{
		desc = "Git Blame: Copy SHA hash",
		cmd = ":GitBlameCopySHA<CR>",
	},
	{
		desc = "Git Blame: Copy commit URL",
		cmd = ":GitBlameCopyCommitURL<CR>",
	},
})

-- LSP
commander.add({
	{
		desc = "LSP: Show definition & references",
		cmd = "<CMD>Lspsaga finder<CR>",
		keys = { "n", "gr", silent_noremap },
	},
	{
		desc = "LSP: Go to declaration",
		cmd = "<CMD>lua vim.lsp.buf.declaration()<CR>",
		keys = { "n", "gD", silent_noremap },
	},
	{
		desc = "LSP: Peek definition",
		cmd = "<CMD>Lspsaga peek_definition<CR>",
		keys = { "n", "gd", silent_noremap },
	},
	{
		desc = "LSP: Go to implementation",
		cmd = "<CMD>lua vim.lsp.buf.implementation()<CR>",
		keys = { "n", "gi", silent_noremap },
	},
	{
		desc = "LSP: Show hover",
		cmd = "<CMD>lua vim.lsp.buf.hover()<CR>",
		keys = { "n", "gh", silent_noremap },
	},
	{
		desc = "LSP: See Code Actions",
		cmd = "<CMD>Lspsaga code_action<CR>",
		keys = { "n", "<leader>ca", silent_noremap },
	},
	{
		desc = "LSP: Rename",
		cmd = "<CMD>Lspsaga rename<CR>",
		keys = { "n", "<leader>rn", silent_noremap },
	},
	{
		desc = "LSP: Show line diagnostics",
		cmd = "<CMD>Lspsaga show_line_diagnostics<CR>",
		keys = { "n", "<leader>D", silent_noremap },
	},
	{
		desc = "LSP: Show cursor diagnostics",
		cmd = "<CMD>Lspsaga show_cursor_diagnostics<CR>",
		keys = { "n", "<leader>d", silent_noremap },
	},
	{
		desc = "LSP: Jump to next diagnostic",
		cmd = "<CMD>Lspsaga diagnostic_jump_next<CR>",
		keys = { "n", "]d", silent_noremap },
	},
	{
		desc = "LSP: Jump to previous diagnostic",
		cmd = "<CMD>Lspsaga diagnostic_jump_prev<CR>",
		keys = { "n", "[d", silent_noremap },
	},
	{
		desc = "LSP: Show hover documentation",
		cmd = "<CMD>Lspsaga hover_doc<CR>",
		keys = { "n", "<leader>hd", silent_noremap },
	},
	{
		desc = "LSP: See outline on right hand side",
		cmd = "<CMD>Lspsaga outline<CR>",
		keys = { "n", "<leader>o", silent_noremap },
	},
	{
		desc = "LSP: Toggle terminal",
		cmd = "<CMD>Lspsaga term_toggle<CR>",
		keys = {
			{ "n", "<leader>tt" },
			{ "t", "<leader>tt" },
		},
	},
	{
		desc = "LSP: [Typescript] Rename file",
		cmd = "<CMD>TypescriptRenameFile<CR>",
		keys = { "n", "<leader>rf", silent_noremap },
	},
	{
		desc = "LSP: [Typescript] Organize imports",
		cmd = "<CMD>TypescriptOrganizeImports<CR>",
		keys = { "n", "<leader>oi", silent_noremap },
	},
	{
		desc = "LSP: [Typescript] Remove unused variables",
		cmd = "<CMD>TypescriptRemoveUnused<CR>",
		keys = { "n", "<leader>ru", silent_noremap },
	},
	{
		desc = "LSP: [Typescript] Fix all",
		cmd = "<CMD>TypescriptFixAll<CR>",
		keys = { "n", "<leader>fa", silent_noremap },
	},
})

-- NeoTest
commander.add({
	{
		desc = "NeoTest: Run nearest test",
		cmd = "<CMD>lua require('neotest').run.run()<CR>",
		keys = { "n", "<leader>T", silent_noremap },
	},
	{
		desc = "NeoTest: Run all tests in file",
		cmd = "<CMD>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
		keys = { "n", "<leader>Tf", silent_noremap },
	},
	{
		desc = "NeoTest: Toggle the output panel",
		cmd = "<CMD>lua require('neotest').output_panel.toggle()<CR>",
		keys = { "n", "<leader>To", silent_noremap },
	},
	{
		desc = "NeoTest: Open test output",
		cmd = "<CMD>lua require('neotest').output.open({ enter = true })<CR>",
		keys = { "n", "<leader>Te", silent_noremap },
	},
})

-- Marks
commander.add({
	{
		cmd = "",
		desc = "Marks: Add marker",
		keys = { "n", "mx", silent_noremap },
	},
	{
		cmd = "",
		desc = "Marks: Set the next available alphabetical (lowercase) mark",
		keys = { "n", "m,", silent_noremap },
	},
	{
		cmd = "",
		desc = "Marks: Toggle the next available mark",
		keys = { "n", "m;" },
	},
	{
		cmd = "",
		desc = "Marks: Delete mark x",
		keys = { "n", "dmx", noremap },
	},
})

-- Move Lines
commander.add({
	{
		desc = "Move Lines: Move line up",
		cmd = "<CMD>m .+1<CR>==",
		keys = { "n", "<A-k>", silent_noremap },
	},
	{
		desc = "Move Lines: Move line down",
		cmd = "<CMD>m .-2<CR>==",
		keys = { "n", "<A-j>", silent_noremap },
	},
})

-- Vim Dadbod UI
commander.add({
	{
		desc = "Vim Dadbod UI: Open database UI",
		cmd = "<CMD>DBUI<CR>",
		keys = { "n", "<leader>db", silent_noremap },
	},
	{
		desc = "Vim Dadbod UI: Save query",
		cmd = "<leader>W",
		keys = { "n", "<leader>W", silent_noremap },
	},
})

-- Go Structrue
commander.add({
	{
		desc = "Go Structrue: Toggle structure",
		cmd = "<CMD>lua require'structrue-go'.toggle()<CR>",
		keys = { "n", "<leader>m", silent_noremap },
	},
	{
		desc = "Go Structrue: Center symbol",
		cmd = "<CMD>lua require'structrue-go'.center_symbol()<CR>",
		keys = { "n", "<leader>f", silent_noremap },
	},
	{
		desc = "Go Structrue: Fold toggle",
		cmd = "<CMD>lua require'structrue-go'.fold_toggle()<CR>",
		keys = { "n", "<leader>z", silent_noremap },
	},
	{
		desc = "Go Structrue: Preview open",
		cmd = "<CMD>lua require'structrue-go'.preview_open()<CR>",
		keys = { "n", "P", silent_noremap },
	},
	{
		desc = "Go Structrue: Preview close",
		cmd = "<CMD>lua require'structrue-go'.preview_close()<CR>",
		keys = { "n", "\\p", silent_noremap },
	},
})

-- LazyGit
commander.add({
	{
		desc = "LazyGit: Open lazygit",
		cmd = "<CMD>LazyGit<CR>",
		keys = { "n", "<leader>lg", silent_noremap },
	},
})

commander.add({
	{
		desc = "Project: Open project",
		cmd = "<CMD>Telescope projects<CR>",
	},
})

-- telescope.load_extension("commander")
