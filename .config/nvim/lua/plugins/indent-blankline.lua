return {
  "lukas-reineke/indent-blankline.nvim",
  config = function ()
    require("ibl").setup({
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
    })
  end
}
