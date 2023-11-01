return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    indent = {
      char = '▏',
      highlight = 'IblIndent'
    },
    scope = {
      char = '▏',
      highlight = 'GruvboxYellow',
      include = { -- use additional nodes as scope
        node_type = {
          lua = {
            'return_statement', 'table_constructor'
          },
          cpp = {
            'for_range_loop'
          },
          c = {
            'union_specifier'
          }
        }
      }
    },
    exclude = { filetypes = { 'asm' } }
  }
}
