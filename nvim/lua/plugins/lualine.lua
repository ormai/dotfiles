return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      icons_enabled = true,
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      always_divide_middle = true,
      globalstatus = true
    },
    sections = {
      lualine_a = { { 'mode', separator = { left = '', right = '' } } },
      lualine_b = {
        {
          'filename',
          newfile_status = true,
          symbols = {
            modified = '', readonly = '', unnamed = '', newfile = ''
          }
        },
        { 'branch', icon = '' },
        {
          'diff', symbols = { added = ' ', modified = ' ', removed = ' ' }
        }
      },
      lualine_c = { 'diagnostics' },
      lualine_x = { '%S', 'searchcount', 'selectioncount' },
      lualine_y = {
        { 'filetype', icon = { align = 'right' } },
        'fileformat',
        'encoding'
      },
      lualine_z = {
        'location',
        { 'progress', separator = { left = '', right = '' } }
      }
    }
  }
}
