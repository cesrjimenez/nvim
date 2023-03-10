local structrue_status, structrue = pcall(require, "structrue-go")
if not structrue_status then
	return
end

structrue.setup()
