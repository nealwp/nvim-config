return {
    'nvim-telescope/telescope.nvim',
    requires = {
        { 'nvim-lua/plenary.nvim' }
    },
    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>f', builtin.find_files, {})
        vim.keymap.set('n', '<leader>ex', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})

        vim.keymap.set('n', '<leader>s', function()
            builtin.grep_string({ search = vim.call('expand', '<cword>') });
        end)

        vim.keymap.set('n', '<leader>g', function()
            builtin.live_grep();
        end)
    end
}
