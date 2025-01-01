return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        require('telescope').setup({
            extensions = {
                fzf = {}
            }
        })

        require('telescope').load_extension('fzf')

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '_', builtin.find_files)
        vim.keymap.set('n', '<leader>h', builtin.help_tags)
        vim.keymap.set('n', '<leader>k', builtin.keymaps)
        vim.keymap.set('n', '<leader>q', builtin.quickfix)
        vim.keymap.set('n', '<leader>b', builtin.buffers)
        vim.keymap.set('n', '<leader>f', builtin.git_files)

        vim.keymap.set('n', '<leader>s', function()
            builtin.grep_string({ search = vim.call('expand', '<cword>') });
        end)

        vim.keymap.set('n', '<leader>g', function()
            builtin.live_grep();
        end)
    end
}
