---[[
local builtin = require('telescope.builtin')

-- leader pf find files
vim.keymap.set('n', '<leader>pv', builtin.find_files, {})

-- ctrl + p to search files in git
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- leader s to search a word
vim.keymap.set('n', '<leader>s', function()
    builtin.grep_string({ search = vim.call("expand", "<cword>") });
end)

-- leader g to live grep 
vim.keymap.set('n', '<leader>g', function()
    builtin.live_grep();
end)
--
-- leader r to show references
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
--]]
