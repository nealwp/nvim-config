return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"saghen/blink.cmp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	config = function(_, opts)
		require("mason").setup()
		require("mason-lspconfig").setup()

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				local capabilities = require("blink.cmp").get_lsp_capabilities()
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
				})
			end,
		})

		require("lspconfig").lua_ls.setup({
			on_init = function(client)
				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				})
			end,
			settings = {
				Lua = {},
			},
		})
	end,
}
