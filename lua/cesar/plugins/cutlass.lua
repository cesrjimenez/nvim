local cutlass_status, cutlass = pcall(require, "cutlass")
if not cutlass_status then
	return
end

cutlass.setup({
	cut_key = "x",
})
