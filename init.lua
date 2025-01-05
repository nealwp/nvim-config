require("config.lazy")
require("nealwp.testwindow")

--[[ vim options ]]
vim.opt.backup = false
vim.opt.colorcolumn = "120"
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.signcolumn = 'yes'
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.wrap = false

vim.cmd.colorscheme "catppuccin"

-- autoformat
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.py", "*.ts", "*.css", "*.html", "*.scss", "*.lua", "*.js" },
    callback = function()
        vim.lsp.buf.format()
    end,
})

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end,
})

--[[ keymaps ]]

-- move selections with Shift+J and Shift+K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- these are here for habit breaking
vim.keymap.set("n", "<leader>q", "<nop>")
vim.keymap.set("n", "<leader>qq", "<nop>")
vim.keymap.set("n", "<leader>ex", "<nop>")

vim.keymap.set("n", "Q", "<nop>")
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
-- reload file with leader e
vim.keymap.set('n', '<leader>e', ':e<CR>')

-- quit vim with leader x
vim.keymap.set("n", "<leader><Esc><Esc>", ":q<CR>")

-- keep visual selection when tabbing
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- replace word under cursor with yanked text
vim.keymap.set("n", "S", "\"_diwP")
