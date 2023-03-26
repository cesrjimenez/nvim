local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local command_center_status, command_center = pcall(require, "command_center")
if not command_center_status then
	return
end

local noremap = { noremap = true }
local silent_noremap = { noremap = true, silent = true }

-- general keymaps
command_center.add({
	{
		desc = "Core: Escape insert mode",
		cmd = "<ESC>",
		keys = { "i", "js", noremap },
	},
	{
		desc = "Core: Clear search",
		cmd = "<leader>nh",
		keys = { "n", ":nohl<CR>", noremap },
	},
	{
		desc = "Core: Increment ints",
		cmd = "<leader>+",
		keys = { "n", "<C-a>", noremap },
	},
	{
		desc = "Core: Decrement ints",
		cmd = "<leader>-",
		keys = { "n", "<C-x>", noremap },
	},
	{
		desc = "Core: Find and replace",
		cmd = ":%s@",
	},
})

-- Window Mappings
command_center.add({
	{
		desc = "Window: Split horizontal",
		cmd = "<leader>sh",
		keys = { "n", "<C-w>s", noremap },
	},
	{
		desc = "Window: Split vertical",
		cmd = "<leader>sv",
		keys = { "n", "<C-w>v", noremap },
	},
	{
		desc = "Window: Split equal width",
		cmd = "<leader>se",
		keys = { "n", "<C-w>=", noremap },
	},
	{
		desc = "Window: Close current split window",
		cmd = "<leader>sx",
		keys = { "n", ":close<CR>", noremap },
	},
	{
		desc = "Window: Maximize current window",
		cmd = "<leader>sm",
		keys = { "n", ":MaximizerToggle<CR>", noremap },
	},
})

-- Tabs and Buffers
command_center.add({
	{
		desc = "Tab: Open new tab",
		cmd = "<leader>to",
		keys = { "n", ":tabnew<CR>", noremap },
	},
	{
		desc = "Tab: Close current tab",
		cmd = "<leader>tx",
		keys = { "n", ":tabclose<CR>", noremap },
	},
	{
		desc = "Tab: Next tab",
		cmd = "<leader>tn",
		keys = { "n", ":tabn<CR>", noremap },
	},
	{
		desc = "Tab: Previous tab",
		cmd = "<leader>tp",
		keys = { "n", ":tabp<CR>", noremap },
	},
})

-- Navigation
command_center.add({
	{
		desc = "Directory: Open directory at current file",
		cmd = "<leader>k",
		keys = { "n", ":NvimTreeToggle<CR>", noremap },
	},
})

-- Telescope
command_center.add({
	{
		desc = "Telescope: Find files",
		cmd = "<leader>ff",
		keys = { "n", "<CMD>Telescope find_files<CR>", noremap },
	},
	{
		desc = "Telescope: Find string",
		cmd = "<leader>fs",
		keys = { "n", "<CMD>Telescope live_grep<CR>", noremap },
	},
	{
		desc = "Telescope: Find string under cursor",
		cmd = "<leader>fg",
		keys = { "n", "<CMD>Telescope grep_string<CR>", noremap },
	},
	{
		desc = "Telescope: Find buffers",
		cmd = "<leader>fk",
		keys = { "n", "<CMD>Telescope buffers<CR>", noremap },
	},
	{
		desc = "Telescope: Fuzzy find current buffer",
		cmd = "<leader>fh",
		keys = { "n", "<CMD>Telescope current_buffer_fuzzy_find<CR>", noremap },
	},
	{
		-- If no keys are specified, no keymaps will be displayed nor set
		desc = "Telescope: Find hidden files",
		cmd = "<CMD>Telescope find_files hidden=true<CR>",
	},
	{
		desc = "Telescope: File Browser",
		cmd = "<leader>fb",
		keys = { "n", ":Telescope file_browser path=%:p:h", noremap },
	},
})

-- Command Center w/ Telescope
command_center.add({
	{
		desc = "Telescope: Open command_center",
		cmd = "<CMD>Telescope command_center<CR>",
		keys = {
			{ "n", "<Leader>fc", noremap },
			{ "v", "<Leader>fc", noremap },
			-- If ever hesitate when using telescope start with <leader>f,
			-- also open command center
			{ "n", "<Leader>f", noremap },
			{ "v", "<Leader>f", noremap },
		},
	},
}, command_center.mode.REGISTER_ONLY)

-- Trouble
command_center.add({
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
command_center.add({
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
command_center.add({
	{
		desc = "Harpoon: Toggle harpoon",
		cmd = "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>",
		keys = { "n", "<Leader>h", silent_noremap },
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
command_center.add({
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
command_center.add({
	{
		desc = "Nvim Tree: Toggle Nvim Tree",
		cmd = "<CMD>NvimTreeToggle<CR>",
		keys = { "n", "<Leader>k", silent_noremap },
	},
})

-- Hierarchy Tree Go
command_center.add({
	{
		desc = "Hierarchy Tree: Call incoming",
		cmd = "<leader>fi",
		keys = { "n", ":lua require'hierarchy-tree-go'.incoming()", silent_noremap },
	},
	{
		desc = "Hierarchy Tree: Call outgoing",
		cmd = "<leader>fo",
		keys = { "n", ":lua require'hierarchy-tree-go'.outgoing()", silent_noremap },
	},
	{
		desc = "Hierarchy Tree: Open hierarchy tree",
		cmd = "<leader>ho",
		keys = { "n", ":lua require'hierarchy-tree-go'.open()", silent_noremap },
	},
	{
		desc = "Hierarchy Tree: Close hierarchy tree",
		cmd = "<leader>hc",
		keys = { "n", ":lua require'hierarchy-tree-go'.close()", silent_noremap },
	},
	{
		desc = "Hierarchy Tree: Focus hierarchy tree",
		cmd = "<leader>fu",
		keys = { "n", ":lua require'hierarchy-tree-go'.focus()", silent_noremap },
	},
	{
		desc = "Hierarchy Tree: Expand hierarchy tree",
		cmd = "o",
		keys = { "n", ":lua require'hierarchy-tree-go'.expand()", silent_noremap },
	},
	{
		desc = "Hierarchy Tree: Jump to selection",
		cmd = "<CR>",
		keys = { "n", ":lua require'hierarchy-tree-go'.jump()", silent_noremap },
	},
})

-- Git Blame
command_center.add({
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
command_center.add({
	{
		desc = "LSP: Show definition & references",
		cmd = "<CMD>Lspsaga lsp_finder<CR>",
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
command_center.add({
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

-- Trailblazer
command_center.add({
	{
		desc = "Trailblazer: Add marker  ",
		cmd = "<CMD>TrailBlazerNewTrailMark<CR>",
		keys = { "n", "<leader>ma", silent_noremap },
	},
	{
		desc = "Trailblazer: Trackback go to Basecamp  (consume)",
		cmd = "<CMD>TrailBlazerTrackBack<CR>",
		keys = { "n", "<leader>mb", silent_noremap },
	},
	{
		desc = "Trailblazer: Track back marker (peek)  ",
		cmd = "<CMD>TrailBlazerPeekMovePreviousUp<CR>",
		keys = { "n", "<leader>mM", silent_noremap },
	},
	{
		desc = "Trailblazer: Track forward marker (peek)  ",
		cmd = "<CMD>TrailBlazerPeekMoveNextDown<CR>",
		keys = { "n", "<leader>mm", silent_noremap },
	},
	{
		desc = "Trailblazer: Jump to closest marker",
		cmd = "<CMD>TrailBlazerMoveToNearest<CR>",
		keys = { "n", "<leader>mc", silent_noremap },
	},
	{
		desc = "Trailblazer: Open marker list",
		cmd = "<CMD>TrailBlazerToggleTrailMarkList<CR>",
		keys = { "n", "<leader>ml", silent_noremap },
	},
})

-- Mind Notes
command_center.add({
	{
		desc = "Mind Notes: Open mind notes [Global]",
		cmd = "<CMD>MindOpenMain<CR>",
		keys = { "n", "<leader>M", silent_noremap },
	},
	{
		desc = "Mind Notes: Open mind notes [Project]",
		cmd = "<CMD>MindOpenProject<CR>",
		keys = { "n", "<leader>Mp", silent_noremap },
	},
	{
		desc = "Mind Notes: Add notes inside start - I",
	},
	{
		desc = "Mind Notes: Add notes inside end - i",
	},
	{
		desc = "Mind Notes: Add notes below - o",
	},
	{
		desc = "Mind Notes: Add notes above - O",
	},
})

-- Move Lines
command_center.add({
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
command_center.add({
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
command_center.add({
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
telescope.load_extension("command_center")
