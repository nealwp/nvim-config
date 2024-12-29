return {
    'neovim/nvim-lspconfig',

    dependencies = {
        'saghen/blink.cmp',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },

    config = function(_, opts)
        local mason = require('mason')
        local lspconfig = require('lspconfig')

        mason.setup({})

        require('mason-lspconfig').setup({
            handlers = {
                function(server_name)
                    local capabilities = require('blink.cmp').get_lsp_capabilities()
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT",
                                },
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                workspace = {

                                    library = vim.api.nvim_get_runtime_file("", true),

                                },
                            },
                        }
                    })
                end,
            },
        })
    end
}
