return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/playground",
        },
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {},
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
            })
        end
    }
}
