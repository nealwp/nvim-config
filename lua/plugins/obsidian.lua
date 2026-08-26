-- obsidian.nvim is only needed for markdown files in the vault, so it's
-- installed and configured lazily the first time such a file is opened.
-- NOTE: source moved from epwalsh/obsidian.nvim (stagnant) to the actively
-- maintained community fork obsidian-nvim/obsidian.nvim.
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    pattern = vim.fn.expand("~") .. "/source/personal/obsidian-vault/*.md",
    once = true,
    callback = function()
        vim.pack.add({ "https://github.com/obsidian-nvim/obsidian.nvim" }, { load = true })

        require("obsidian").setup({
            workspaces = {
                {
                    name = "main",
                    path = "~/source/personal/obsidian-vault",
                },
            },
        })

        -- re-trigger buffer read/new now that obsidian.nvim is active
        vim.cmd.edit()
    end,
})
