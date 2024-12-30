return {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    opts = {
        keymap = {
            preset = 'none',

            -- Navigate between completion items
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },

            -- `Enter` key to confirm completion
            ['<Enter>'] = { 'accept', 'fallback' },

            -- Ctrl+Space to trigger completion menu
            ['<C-space>'] = { 'show', 'fallback' },

            -- Scroll up and down in the completion documentation
            ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
        },

        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = 'mono'
        },
        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 0 },
        },
    },
}
