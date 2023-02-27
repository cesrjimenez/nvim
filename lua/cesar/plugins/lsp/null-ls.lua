local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.stylua,
		formatting.goimports,
		formatting.gofmt,
		diagnostics.eslint_d.with({ -- js/ts linter
			diagnostics_format = "[eslint] #{m}\n(#{c})",
			-- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
			condition = function(utils)
				-- return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
				return utils.root_has_file(".tsconfig.eslint.json")
			end,
		}),
	},

	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
						timeout_ms = 2000,
					})
				end,
			})
		end
	end,
})
