return {
  'ellisonleao/gruvbox.nvim',
  config = function()
    require('gruvbox').setup({
      transparent_mode = true,
      overrides = {
        StatusLine = { link = 'Normal' }, -- https://github.com/nvim-lualine/lualine.nvim/issues/867#issuecomment-1287689584
        SignColumn = { link = 'Normal' }
      }
    })

    vim.cmd('colorscheme gruvbox')
  end
}
