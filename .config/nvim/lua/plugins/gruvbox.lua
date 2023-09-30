return {
  "ellisonleao/gruvbox.nvim",
  config = function ()
    require("gruvbox").setup({
      transparent_mode = true,
    })

    vim.cmd("colorscheme gruvbox")

    vim.cmd("hi! link StatusLine Normal") -- https://github.com/nvim-lualine/lualine.nvim/issues/867#issuecomment-1287689584
    vim.cmd("hi! link SignColumn Normal")
  end
}
