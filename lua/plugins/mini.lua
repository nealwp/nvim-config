return {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
        require("mini.ai").setup()
        require("mini.surround").setup()
        require("mini.comment").setup()
    end,
}
