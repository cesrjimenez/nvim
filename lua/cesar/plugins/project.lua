local project_status, project = pcall(require, "project_nvim")
if not project_status then
	return
end

project.setup({
	manual_mode = true,
	patterns = { ".git", "go.mod", "package.json", "go.sum" },
})

require("telescope").load_extension("projects")
