local neotest_status, neotest = pcall(require, "neotest")
if not neotest_status then
	return
end

local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
	virtual_text = {
		format = function(diagnostic)
			local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
			return message
		end,
	},
}, neotest_ns)

neotest.setup({
	-- your neotest config here
	--	log_level = vim.log.levels.DEBUG,
	adapters = {
		-- require("neotest-go")({
		-- 	experimental = {
		-- 		test_table = true,
		-- 	},
		-- 	args = { "-count=1", "-timeout=60s" },
		-- }),
		require("neotest-vim-test")({
			ignore_file_types = { "python", "vim", "lua" },
		}),
	},
})
