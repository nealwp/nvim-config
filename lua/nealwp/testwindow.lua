-- run tests in a floating terminal
function RunTests(cmd)
    local editor_width = 0
    local editor_height = 0

    local windows = vim.api.nvim_list_wins()

    for _, window in pairs(windows) do
        editor_width = editor_width + vim.api.nvim_win_get_width(window)
        local window_height = vim.api.nvim_win_get_height(window)
        if window_height > editor_height then
            editor_height = window_height
        end
    end

    local width = math.floor(editor_width * 0.75)
    local height = math.floor(editor_height * 0.75)
    local row = math.floor((editor_height - height) / 2)
    local col = math.floor((editor_width - width) / 2)
    local buf = vim.api.nvim_create_buf(true, true)

    --vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#0f0f0f' })

    vim.api.nvim_open_win(buf, true,
        {
            relative = 'editor',
            row = row,
            col = col,
            width = width,
            height = height,
            style = 'minimal',
            border = 'rounded',
            footer = 'Run Tests',
            footer_pos = 'center',
        })

    vim.fn.termopen(cmd, {
        on_exit = function(_, code)
            vim.cmd('stopinsert')
        end
    })

    vim.api.nvim_set_option_value('scrollback', 10000, { buf = buf })
    vim.cmd('startinsert')
    vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':quit!<CR>', { noremap = true, silent = true })
end

-- register function as a command
vim.api.nvim_create_user_command('RunTests', function(opts)
        RunTests(opts.args)
    end,
    { nargs = 1, desc = 'Run tests in a floating window' }
)

-- ensure terminal opening looks right
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

-- set leader t for running tests with typscript files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "typescript",
    callback = function()
        vim.api.nvim_set_keymap('n', '<leader>t', ':RunTests npm test<CR>', { noremap = true, silent = true })
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.api.nvim_set_keymap('n', '<leader>t', ':RunTests source .venv/bin/activate && pytest<CR>',
            { noremap = true, silent = true })
    end
})

-- unset leader t when not python
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    command = 'autocmd! FileType python',
})

-- unset leader t when not typescript
vim.api.nvim_create_autocmd("FileType", {
    pattern = "typescript",
    command = 'autocmd! FileType typescript',
})
