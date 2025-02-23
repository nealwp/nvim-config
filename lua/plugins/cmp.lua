return {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    opts = {
        appearance = {
            nerd_font_variant = 'normal',
        },
        keymap = {
            preset = 'none',

            -- Navigate between completion items
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },

            -- `Enter` key to confirm completion
            ['<CR>'] = { 'select_and_accept', 'fallback' },

            -- Ctrl+Space to trigger completion menu
            ['<C-space>'] = { 'show', 'fallback' },

            -- Scroll up and down in the completion documentation
            ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },

        },
        sources = {
            default = { 'lsp', 'path', 'snippets' },
        },
        completion = {
            accept = { auto_brackets = { enabled = false }, },
        },
        cmdline = {
            keymap = {
                ['<C-k>'] = { 'select_prev', 'fallback' },
                ['<C-j>'] = { 'select_next', 'fallback' },
                ['<Tab>'] = { 'select_and_accept', 'fallback' },
            }
        }
    },
}
