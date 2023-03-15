local hierarchy_status, hierarchy = pcall(require, "hierarchy-tree-go")
if not hierarchy_status then
	hierarchy = {}
end

hierarchy.setup()
