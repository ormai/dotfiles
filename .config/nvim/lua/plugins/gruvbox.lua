return {
  'ellisonleao/gruvbox.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('gruvbox') .setup({
      transparent_mode = true,
      overrides = {
        StatusLine = { link = 'Normal' }, -- https://github.com/nvim-lualine/lualine.nvim/issues/867#issuecomment-1287689584
        CursorLineNr = { bg = 'NONE' },
        NoiceCmdlinePopupBorder = { link = 'FloatBorder' }
      }
    })

    vim.cmd('colorscheme gruvbox')
  end
}
