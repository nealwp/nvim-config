vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Run build steps for plugins that need them, in response to install/update.
-- Must be registered before the `vim.pack.add()` call below.
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name = ev.data.spec.name
        local kind = ev.data.kind

        if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
            -- NOTE: on this machine `make` needs to use zig instead of gcc;
            -- the Makefile has been manually adjusted for that.
            vim.system({ "make" }, { cwd = ev.data.path })
        end
    end,
})

vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    -- pinned to the v1 line: `main` now tracks blink.cmp v2, which is under
    -- active development with breaking changes and a new required dependency
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1") },
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/echasnovski/mini.nvim",
    "https://github.com/stevearc/conform.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
}, { confirm = false })

-- obsidian.nvim is installed and configured lazily, see plugins/obsidian.lua

require("plugins.colorscheme")
require("plugins.treesitter")
require("plugins.mini")
require("plugins.cmp")
require("plugins.lsp")
require("plugins.formatting")
require("plugins.telescope")
require("plugins.obsidian")
