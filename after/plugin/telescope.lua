---[[
local builtin = require('telescope.builtin')

-- leader pf find files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- ctrl + p to search files in git
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- leader g to grep a string
vim.keymap.set('n', '<leader>g', function()
    builtin.grep_string({ search = vim.call("expand", "<cword>") });
end)

-- leader r to show references
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
--]]
