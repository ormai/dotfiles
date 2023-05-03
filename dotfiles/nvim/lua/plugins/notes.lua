return {
    {
        "renerocksai/telekasten.nvim",
        ft = "markdown",
        keys = { {"<C-p>", "<cmd>Telekasten<CR>"}, },
        dependencies = {"nvim-telescope/telescope.nvim"},
        config = function ()
            require('telekasten').setup({
                home = vim.fn.expand("~/vault"), -- Put the name of your notes directory here
            })
        end
    },
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        config = function ()
            vim.cmd[[let g:mkdp_auto_start = 1]]
            vim.cmd[[let g:mkdp_markdown_css = "~/.config/nvim/markdown.css"]]
        end
    }
}
