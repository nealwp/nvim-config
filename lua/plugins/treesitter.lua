return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/playground",
        },
        opts = {
            ensure_installed = { "python", "typescript", "bash", "lua", "yaml", "json", "html", "go" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["ab"] = "@block.outer",
                        ["ib"] = "@block.inner",
                        ["ii"] = "@conditional.inner",
                        ["ai"] = "@conditional.outer",
                        ["ia"] = "@assignment.inner",
                        ["aa"] = "@assignment.outer",
                    },
                },
            },
        }
    }
}
