return {
    'neovim/nvim-lspconfig',

    dependencies = {
        'saghen/blink.cmp',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },

    config = function(_, opts)
        require('mason').setup()
        require('mason-lspconfig').setup()

        require('mason-lspconfig').setup_handlers({
            function(server_name)
                local capabilities = require('blink.cmp').get_lsp_capabilities()
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities
                })
            end,
        })
    end
}
