return {
  "lukas-reineke/indent-blankline.nvim",
  config = function ()
    require("indent_blankline").setup {
      char = '│',
      space_char_blankline = " ",
      show_trailing_blankline_indent = false,
      -- Context indent highlighted by treesitter
      use_tresitter = true,
      show_current_context = true,
      show_current_context_start = true,
      filetype_exclude = {
        "toggleterm",
        "help",
        "man",
        "text",
        "asm",
        "yuck",
      }
    }
  end
}
