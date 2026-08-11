return {
    {
        "vyfor/cord.nvim",
        event = "VeryLazy",
        config = function()
            require("cord").setup()
        end,
    },
}
