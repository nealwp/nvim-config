function _G.snake()
	local word = vim.fn.expand("<cword>")

	local snake_case = word:gsub("(%l)(%u)", "%1_%2"):lower()

	vim.api.nvim_command("normal! ciw" .. snake_case)
end

function _G.camel()
	local word = vim.fn.expand("<cword>")

	local camel_case = word:gsub("_(%l)", function(letter)
		return letter:upper()
	end)

	vim.api.nvim_command("normal! ciw" .. camel_case)
end

vim.api.nvim_create_user_command("Snake", snake, {})
vim.api.nvim_create_user_command("Camel", camel, {})
