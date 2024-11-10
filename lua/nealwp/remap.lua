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

-- command mode with leader c
vim.keymap.set("n", "<leader>c", ":")

-- command line with leader C
vim.keymap.set("n", "<leader>C", ":!")

-- yank to "* with leader y
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>yy", '"+yy')

-- del to "+ with leader d
vim.keymap.set("v", "<leader>d", '"+d')
vim.keymap.set("n", "<leader>dd", '"+dd')

-- paste from "+ with leader p
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')


-- keep visual selection when tabbing
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- toggle twilight with leader l
vim.keymap.set("n", "<leader>l", ":Twilight<CR>")

-- rename symbol with leader 2 
vim.keymap.set("n", "<leader>2", vim.lsp.buf.rename)

-- format file with leader f
vim.keymap.set("n", "<leader>f", "magg=G`a")

-- jump between splits with ctrl
vim.keymap.set("n", "<c-l>", "<c-w><c-l>")
vim.keymap.set("n", "<c-h>", "<c-w><c-h>")
vim.keymap.set("n", "<c-k>", "<c-w><c-k>")
vim.keymap.set("n", "<c-j>", "<c-w><c-j>")

-- replace word under cursor with yanked text
vim.keymap.set("n", "S", "\"_diwP")


