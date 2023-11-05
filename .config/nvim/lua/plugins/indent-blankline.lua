return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    indent = {
      char = '▏',
      priority = 1,
      highlight = 'IblIndent'
    },
    scope = {
      char = '▏',
      priority = 1024,
      highlight = 'GruvboxYellow',
      include = { -- use additional nodes as scope
        node_type = {
          lua = {
            'return_statement', 'table_constructor'
          },
          cpp = {
            'for_range_loop'
          }
        }
      }
    },
    exclude = {
      filetypes = {
        'asm'
      }
    }
  }
}
