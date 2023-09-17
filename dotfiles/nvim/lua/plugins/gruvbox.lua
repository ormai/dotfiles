return {
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
}
