return {

    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        config = function ()
            vim.cmd[[let g:mkdp_auto_start = 1]]
            vim.cmd[[let g:mkdp_markdown_css = "~/.config/nvim/markdown.css"]]
        end
    },

    {
        "epwalsh/obsidian.nvim",
        event = { "BufreadPre " .. vim.fn.expand "~" .. "/vault/**.md" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("obsidian").setup({
                dir = "~/vault",
                completion = {
                    nvim_cmp = true,
                },
                disable_frontmatter = true,
                templates = {
                    subdir = "meta/syntax/templates",
                    date_format = "%d-%m-%Y",
                    time_format = "%H_%M",
                },
                follow_url_func = function(url) -- open url in default browser
                    vim.fn.jobstart({"xdg-open"}, url)
                end,
                finder = "telescope.nvim",
            })
        end
    }
}
