return {
  'folke/zen-mode.nvim',
  keys = {
    { '<Space>z', '<cmd>ZenMode<cr>', desc = 'Toggle ZenMode' }
  },
  cmd = 'ZenMode',
  opts = {
    window = {
      backdrop = 1,
      width = 100,
      -- height = .95,
      options = {
        number = false,
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
