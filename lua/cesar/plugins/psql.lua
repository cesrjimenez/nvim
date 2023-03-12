local psql_status, psql = pcall(require, "psql")
if not psql_status then
	return
end

psql.setup({
	database_name = "sourcegraph",
})
