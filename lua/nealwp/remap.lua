vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- vim.keymap.set("mode", "keycombo", "action")

-- move selections with Shift+J and Shift+K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep copied text when highlight & paste over
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("i", "\"", "\"\"<ESC>ha")
vim.keymap.set("i", "'",  "''<ESC>ha")
vim.keymap.set("i", "{", "{}<ESC>ha")
vim.keymap.set("i", "[", "[]<ESC>ha")
vim.keymap.set("i", "`", "``<ESC>ha")
vim.keymap.set("i", "/*", "/*  */<ESC>3ha")

-- save file with leader w
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- quit vim with leader q
vim.keymap.set("n", "<leader>q", ":q<CR>")

