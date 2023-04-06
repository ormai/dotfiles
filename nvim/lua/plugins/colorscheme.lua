return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
    -- https://github.com/ellisonleao/gruvbox.nvim/blob/main/lua/gruvbox/init.lua
    local bg = "#282828"

    require("gruvbox").setup({
      undercurl = true,
      underline = true,
      bold = true,
      italic = true,
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "",  -- values: "hard", "soft", ""
      overrides = {
        SignColumn        = { bg = bg },
        GruvboxGreenSign  = { bg = bg },
        GruvboxAquaSign   = { bg = bg },
        GruvboxRedSign    = { bg = bg },
        GruvboxYellowSign = { bg = bg },
      },
      dim_inactive = false,
      transparent_mode = true,
    })
    vim.cmd("colorscheme gruvbox")
  end
}
