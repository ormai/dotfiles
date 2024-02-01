return {
  'ellisonleao/gruvbox.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('gruvbox').setup({
      transparent_mode = true,
      overrides = {
        CursorLineNr = { bg = '', bold = true },      -- Remove bg in line number
        SignColumn = { link = 'Normal' },             -- Normal bg
        NoiceCmdlinePopupBorder = { link = 'FloatBorder' }, -- Noice cmdline border

        -- In order to use lualine configuration similar to <https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/bubbles.lua>defa
        -- Solution found here <https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/bubbles.lua>
        StatusLine = { link = 'Normal' },
      }
    })

    vim.cmd('colorscheme gruvbox')
  end
}
