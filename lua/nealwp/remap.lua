vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- vim.keymap.set("mode", "keycombo", "action")

-- move selections with Shift+J and Shift+K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>q", "<nop>")
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")

vim.keymap.set("i", "<Up>", "<nop>")
vim.keymap.set("i", "<Down>", "<nop>")
vim.keymap.set("i", "<Left>", "<nop>")
vim.keymap.set("i", "<Right>", "<nop>")

-- save file with leader w
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- quit vim with leader q
vim.keymap.set("n", "<leader>qq", ":q<CR>")

-- quit vim without saving  leader Q
vim.keymap.set("n", "<leader>Q", ":q!<CR>")

-- keep visual selection when tabbing
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- jump between splits with ctrl
vim.keymap.set("n", "<c-l>", "<c-w><c-l>")
vim.keymap.set("n", "<c-h>", "<c-w><c-h>")
vim.keymap.set("n", "<c-k>", "<c-w><c-k>")
vim.keymap.set("n", "<c-j>", "<c-w><c-j>")

-- replace word under cursor with yanked text
vim.keymap.set("n", "S", "\"_diwP")

local builtin = require('telescope.builtin')

-- leader pf find files
vim.keymap.set('n', '<leader>f', builtin.find_files, {})

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
