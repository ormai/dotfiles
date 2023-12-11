return {
  'folke/zen-mode.nvim',
  keys = {
    { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Toggle ZenMode' }
  },
  cmd = 'ZenMode',
  opts = {
    window = {
      width = 80,
      options = {
        number = false,
        relativenumber = false,
        cursorline = false,
        list = false,
        signcolumn = 'no'
      }
    },
    plugins = {
      options = {
        enabled = true,
        laststatus = 0,
        showcmd = false,
        ruler = false
      }
    }
  }
}
