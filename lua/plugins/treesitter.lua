-- No parsers are pre-installed. Whenever a filetype is opened, install its
-- treesitter parser on demand (if one is available and not already
-- installed), then start treesitter highlighting/indentation for it.
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match) or args.match

        local function start()
            pcall(vim.treesitter.start, args.buf)
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end

        -- Parser already installed/available (built-in or previously installed)?
        local ok, added = pcall(vim.treesitter.language.add, lang)
        if ok and added then
            start()
            return
        end

        -- Otherwise, install it on demand if nvim-treesitter knows about it.
        local ok, available = pcall(function()
            return vim.tbl_contains(require("nvim-treesitter.config").get_available(), lang)
        end)

        if ok and available then
            require("nvim-treesitter").install(lang):await(function(err)
                if not err then
                    start()
                end
            end)
        end
    end,
})
