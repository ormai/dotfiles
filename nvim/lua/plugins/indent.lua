return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  -- event = 'BufReadPost',
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
      highlight = 'GruvboxOrange',
      show_start = false,
      show_end = false,
      show_exact_scope = false,
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
        'asm',
        'oil'
      }
    }
  }
}
