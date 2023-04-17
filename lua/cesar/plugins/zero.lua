local zero_status, zero = pcall(require, "zero")
if not zero_status then
	error("This plugin requires the zero.nvim plugin to be installed")
end

zero.setup()
