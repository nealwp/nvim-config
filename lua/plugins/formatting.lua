return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				python = { "black", "ruff", stop_after_first = true },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
			},
		})
	end,
}
