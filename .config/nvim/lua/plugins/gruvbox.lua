return {
  'ellisonleao/gruvbox.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('gruvbox').setup({
      transparent_mode = true, -- Use only the terminal emulator's background
      overrides = {
        -- In order to use lualine configuration similar to <https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/bubbles.lua>
        -- Solution found here <https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/bubbles.lua>
        StatusLine = { link = 'Normal' },

        CursorLineNr = { bg = 'NONE' },                     -- Highlight only the number of the current line

        NoiceCmdlinePopupBorder = { link = 'FloatBorder' }, -- Pop up cmdline has grey border

        SignColumn = { link = 'Normal' }                    -- Prevent extraneous background colors in the SignColumn
      }
    })

    vim.cmd('colorscheme gruvbox')
  end
}
