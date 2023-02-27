local dap_go_ok, dap_go = pcall(require, "dap-go")
if not dap_go_ok then
	return
end

dap_go.setup({
	dap_configurations = {
		{
			type = "go",
			name = "Debug fro asdf",
			request = "launch",
			mode = "test",
			program = ".",
			dlvToolPath = vim.fn.exepath("/Users/cesar/.asdf/installs/golang/1.19.3/packages/bin/dlv"), -- Adjust to where delve is installedj
		},
		{
			type = "go",
			name = "Debug fro asdf dot attach",
			request = "attach",
			program = ".",
			processId = 39129,
		},
	},
})
