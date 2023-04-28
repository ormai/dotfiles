return {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    keys = {
        {
            "<C-t>",
            "<cmd>ToggleTerm<cr>",
            { desc = "ToggleTerm" , silent = true }
        },
    },
    config = function ()
        require("toggleterm").setup{
            size = 20,
        }
    end,
}
