local filetypes = {
  -- "rust",
  "lua",
  "bash",
  "python",
  "c",
  "cpp",
  "html",
  "css",
  "rasi",
  "javascript",
  "typescript",
  "jsonc",
  "markdown",
  "markdown_inline"
}

return {
  "nvim-treesitter/nvim-treesitter",
  ft = filetypes,
  build = ":TSUpdate",
  dependencies = {
    "p00f/nvim-ts-rainbow",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "lukas-reineke/indent-blankline.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "[d", vim.diagnostic.goto_prev },
    { "]d", vim.diagnostic.goto_next },
    { "<leader>e", vim.diagnostic.open_float },
    { "<leader>q", vim.diagnostic.setloclist },
    { "<c-space>", desc = "Incremental selection" },
    { "<bs>", desc = "Decremental selection "}
  },
  config = function ()
    require("nvim-treesitter.configs").setup {
      ensure_installed = filetypes,
      auto_install = true,
      highlight = {
        enable = true
      },
      indent = {
        enable = true
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        enable = true,
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      },

      -- ## nvim-ts-rainbow
      -- parenthesis, brackets and braces have a diffrent color depending op
      -- the nesting level
      rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        colors = {
          "#83A598", -- Level 1
          "#8ec07c",
          "#b8bb26",
          "#fabd2f",
          "#f38019",
          "#fb4934", -- Level 6
        },
      },
    }
  end
}
