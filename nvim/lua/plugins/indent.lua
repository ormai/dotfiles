return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  opts = {
    indent = {
      char = '▏',
      tab_char = '▏',
      highlight = 'IblIndent'
    },
    scope = {
      char = '▏',
      priority = 1024,
      highlight = 'IblScope',
      show_start = false,
      show_end = false,
      show_exact_scope = false
    }
  }
}
