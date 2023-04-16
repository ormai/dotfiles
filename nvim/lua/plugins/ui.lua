return {
    { -- Color scheme
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 10000,
        config = function ()
            local bg = "#282828"

            require("gruvbox").setup({
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    operator = true,
                    comments = true,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- values: "hard", "soft", ""
                overrides = {
                    SignColumn = { bg = bg }, -- remove weird coloring
                    GruvboxGreenSign = { bg = bg },
                    GruvboxAquaSign = { bg = bg },
                    GruvboxRedSign = { bg = bg },
                    GruvboxYellowSign = { bg = bg },
                },
                dim_inactive = false,
                transparent_mode = true,
            })
            vim.cmd("colorscheme gruvbox")
        end
    },
    { -- Status line
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            local diagnostics = {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                sections = { "error", "warn" },
                symbols = { error = " ", warn = " " },
                colored = false,
                update_in_insert = false,
                always_visible = true,
            }
            local diff = {
                "diff",
                colored = true,
                symbols = { added = " ", modified = " ", removed = " " },
            }
            local filetype = { "filetype", icons_enabled = true, }
            local branch = { "branch", icons_enabled = true, icon = "", }

            require("lualine").setup {
                options = {
                    icons_enabled = true,
                    theme = "gruvbox",
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        "toggleterm",
                        -- "help",
                        -- "man"
                    },
                    always_divide_middle = true,
                    globalstatus = true, -- :set laststatus=3
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { branch, diff },
                    lualine_c = { diagnostics },
                    lualine_x = { "filename", "fileformat" },
                    lualine_y = { filetype, "encoding" },
                    lualine_z = { "location", "progress" },
                },
            }
        end
    },
    { -- Tabline
        "kdheepak/tabline.nvim",
        dependencies = {
            "nvim-lualine/lualine.nvim",
            "kyazdani42/nvim-web-devicons",
        },
        keys = { -- Tabline works only after pressing one of these keymap
            {
                "<S-l>",
                "<cmd>TablineBufferNext<cr>",
                desc = "Navigate to next buffer"
            },
            {
                "<S-h>",
                "<cmd>TablineBufferPrevious<cr>",
                desc = "Navigate to previous buffer"
            },
        },
        config = function ()
            require("tabline").setup { -- Tabline uses lualine's config for the major part
                enabled = true,
                options = {
                    max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
                    show_tabs_always = false, -- doesn't word
                    show_devicons = true, -- this shows devicons in buffer section
                    show_filename_only = true, -- show just the filename instead of path
                    modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
                }
            }
        end
    }
}
