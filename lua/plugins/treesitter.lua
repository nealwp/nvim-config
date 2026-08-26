local disabled_ft = { "markdown", "markdown_inline" }

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "*",
				callback = function(args)
					if not vim.list_contains(disabled_ft, args.match) then
						pcall(vim.treesitter.start, args.buf)
					end
					vim.bo[args.buf].indentexpr =
						"v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}
