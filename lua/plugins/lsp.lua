return {
    "neovim/nvim-lspconfig",

	dependencies = {
		"saghen/blink.cmp",
		{ "mason-org/mason.nvim", version = "^1.0.0" },
		{ "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
	},

    config = function(_, opts)
		require("mason").setup()
		require("mason-lspconfig").setup()

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				local capabilities = require("blink.cmp").get_lsp_capabilities()
				vim.lsp.config(server_name, {
					capabilities = capabilities,
				})

				vim.lsp.enable(server_name)
			end,
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				},
			},
		})

		vim.lsp.enable("lua_ls")
	end,
}
