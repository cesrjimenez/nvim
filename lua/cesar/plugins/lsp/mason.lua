local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- local mason_nvim_dap_status, mason_nvim_dap = pcall(require, "mason-nvim-dap")
-- if not mason_nvim_dap_status then
-- 	return
-- end

mason.setup({
	PATH = "prepend",
})

mason_lspconfig.setup({
	ensure_installed = {
		"tsserver",
		"html",
		"cssmodules_ls",
		"gopls",
		"graphql",
		"jsonls",
		"emmet_ls",
		"lua_ls",
		"marksman",
		"pyright",
		"sqlls",
		"tailwindcss",
	},
})

mason_null_ls.setup({
	ensure_installed = {
		"tsserver",
		"prettier",
		"stylua",
		"eslint_d",
		"goimports",
		-- "gofumpt",
		"gofmt",
	},
	automatic_setup = true,
})

-- mason_nvim_dap.setup({
-- 	ensure_installed = {
-- 		"delve",
-- 	},
-- })
