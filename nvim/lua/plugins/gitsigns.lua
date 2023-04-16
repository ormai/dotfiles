return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        require("gitsigns").setup {
            signs = {
                add = {
                    hl = "GitSignsAdd",
                    text = "▎",
                    numhl = "GitSignsAddNr",
                    linehl = "GitSignsAddLn"
                },
                delete = {
                    hl = "GitSignsDelete",
                    text = "",
                    numhl = "GitSignsDeleteNr",
                    linehl = "GitSignsDeleteLn"
                },
                topdelete = {
                    hl = "GitSignsDelete",
                    text = "",
                    numhl = "GitSignsDeleteNr",
                    linehl = "GitSignsDeleteLn"
                },
                change = {
                    hl = "GitSignsChange",
                    text = "▎",
                    numhl = "GitSignsChangeNr",
                    linehl="GitSignsChangeLn"},
                changedelete = {
                    hl = "GitSignsChange",
                    text = "▎",
                    numhl="GitSignsChangeNr",
                    linehl="GitSignsChangeLn"
                },
            },
        }
    end
}
