return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make", },
    },

    keys = {
        {
            "<leader><space>",
            "<cmd>Telescope<CR>",
            desc = "Spawn Telescope"
        },
        {
            "<leader>tr",
            function() require('telescope.builtin').lsp_references() end,
            { buffer = bufnr, desc = "[T]elescope: go to [R]eference" }
        },
        {
            "<leader>ty",
            function() require('telescope.builtin').lsp_document_symbols() end,
            { buffer = bufnr, desc = "[T]elescope: show local s[Y]mbols" }
        },
        {
            "<leader>tm",
            function() require('telescope.builtin').lsp_document_symbols() end,
            { buffer = bufnr, desc = "[T]elescope: show global sy[M]bols" }
        },
        {
            "<leader>tf",
            function() require('telescope.builtin').find_files() end,
            desc = "[T]elescope: search [F]iles"
        },
        {
            "<leader>th",
            function() require('telescope.builtin').help_tags() end,
            desc = "[T]elescope: search [H]elp"
        },
        {
            "<leader>tw",
            function() require('telescope.builtin').grep_string() end,
            desc = "[T]elescope: search current [W]ord"
        },
        {
            "<leader>tg",
            function() require('telescope.builtin').live_grep() end,
            desc = "[T]elescope: live [G]rep"
        },
        {
            "<leader>td",
            function() require('telescope.builtin').diagnostics() end,
            desc = "[T]elescope: [D]iagnostics" },
        {
            "<leader>to",
            function() require('telescope.builtin').oldfiles() end,
            desc = "[T]elescope: [O]ld files"
        },
        {
            "<leader>tb",
            function() require('telescope.builtin').buffers() end,
            desc = "[T]elescope: change [B]uffer"
        },
        {
            "<leader>tk",
            function() require('telescope.builtin').keymaps() end,
            desc = "[T]elescope: find [K]eymaps"
        },
        {
            "<leader>tl",
            function()
                require('telescope.builtin').current_buffer_fuzzy_find(
                    require("telescope.themes").get_dropdown {
                        winblend = 30,
                        previewer = false,
                    }
                ) end,
            desc = "[Telescope]: go to [L]ine"
        },
    },

    config = function()
        require("telescope").setup {
            defaults = {
                mappings = {
                    i = {
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                    },
                },
            },
        }

        pcall(require("telescope").load_extension, "fzf") -- enable fzf-native
    end
}
