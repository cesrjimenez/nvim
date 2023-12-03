vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps
keymap.set("i", "jk", "<ESC>") -- jk to ESC

--keymap.set("n", ":W", ":w<CR>", { noremap = true }) -- save file

keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear search with space+nh

keymap.set("n", "x", '"_x') -- when cutting text don't add it to a global registry
keymap.set("n", "d", '"_d') -- when deleting text don't add it to a global registry
keymap.set("v", "d", '"_d') -- when deleting text don't add it to a global registry

keymap.set("n", "<leader>+", "<C-a>") -- increment ints
keymap.set("n", "<leader>-", "<C-x>") -- decrement ints

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close currrent split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

keymap.set("n", "∆", ":m .+1<CR>==") -- move line up(n)
keymap.set("n", "˚", ":m .-2<CR>==") -- move line down(n)
keymap.set("v", "∆", ":m '>+1<CR>gv=gv") -- move line up(v)
keymap.set("v", "˚", ":m '<-2<CR>gv=gv") -- move line down(v)

keymap.set("n", "<C-k>", "{", { silent = true, noremap = true }) -- move line up(n)
keymap.set("n", "<C-j>", "}", { silent = true, noremap = true }) -- move line down(n)

-- plugin keymaps --

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>k", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fg", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fk", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope current_buffer_fuzzy_find<cr>") -- list available help tags

-- trouble
keymap.set("n", "<leader>=", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>=w", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>=d", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>=l", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>=q", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

-- buffer close
keymap.set("n", "<leader>q", "<CMD>Sayonara<CR>")

-- vim-tmux-navigator
vim.g.tmux_navigator_no_mappings = 1

-- Map Ctrl + arrow keys for tmux navigation
keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true, noremap = true })
keymap.set("n", "<C-Down>", ":TmuxNavigateDown<CR>", { silent = true, noremap = true })
keymap.set("n", "<C-Up>", ":TmuxNavigateUp<CR>", { silent = true, noremap = true })
keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true, noremap = true })
keymap.set("n", "<C-p>", ":TmuxNavigatePrevious<CR>", { silent = true, noremap = true })
