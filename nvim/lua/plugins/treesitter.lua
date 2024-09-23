return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    {
      'hiphish/rainbow-delimiters.nvim',
      config = function()
        vim.g.rainbow_delimiters = {
          highlight = {
            'GruvboxPurple',
            'GruvboxBlue',
            'GruvboxAqua',
            'GruvboxGreen',
            'GruvboxYellow',
            'GruvboxOrange',
            'GruvboxRed',
          }
        }
      end
    },
    'nvim-treesitter/nvim-treesitter-textobjects'
  },
  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = {
        'bash', 'c', 'html', 'lua', 'vim',
        'luadoc', 'markdown', 'vimdoc'
      },
      modules = {},
      sync_install = false,
      ignore_install = {},
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          node_decremental = '<bs>'
        }
      },
      textobjects = {
        enable = true,
        swap = { -- Swap node under the cursor
          enable = true,
          swap_next = { ['<leader>a'] = '@parameter.inner' },
          swap_previous = { ['<leader>A'] = '@parameter.inner' }
        },
        move = {
          enable = true,
          set_jumps = true, -- Register jumps in the jump list
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          }
        }
      }
    }
  end
}
