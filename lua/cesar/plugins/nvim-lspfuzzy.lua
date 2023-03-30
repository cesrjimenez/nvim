local lspfuzzy_status, lspfuzzy = pcall(require, "lspfuzzy")
if not lspfuzzy_status then
	return
end

lspfuzzy.setup()
