return {
	"nvimtools/none-ls.nvim",
	config = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.dotenv_linter,
				null_ls.builtins.hover.printenv,

				null_ls.builtins.diagnostics.cmake_lint,
				null_ls.builtins.formatting.cmake_format,

				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,

				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.golines,
				null_ls.builtins.formatting.goimports_reviser,

				null_ls.builtins.formatting.stylelint,

				null_ls.builtins.formatting.yamlfix,

				null_ls.builtins.diagnostics.sqlfluff.with({
					extra_args = { "--dialect", "postgres" },
				}),
				null_ls.builtins.formatting.sqlfluff.with({
					extra_args = { "--dialect", "postgres" },
				}),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
