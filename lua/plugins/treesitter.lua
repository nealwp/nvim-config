return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {},
				auto_install = true,
				highlight = {
					enable = true,
					disable = { "markdown", "markdown_inline" },
				},
				indent = { enable = true },
			})
		end,
	},
}
