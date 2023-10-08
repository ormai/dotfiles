return {
  "lukas-reineke/indent-blankline.nvim",
  lazy = true, -- after tree-sitter

  opts = {
    indent = {
      char = "▎",
      -- highlight = "hl-Whitespace"
    },
    viewport_buffer = {
      max = 30,
      min = 500
    },
    scope = {
      char = "▎",
      -- highlight = "hl-LineNr"
    },
    exclude = {
      filetypes = {
        "asm"
      }
    }
  },

  config = function (_, opts)
    require("ibl").setup(opts)
  end
}
