---@diagnostic disable: missing-fields
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  lazy = false,
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
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  -- keys = {
  --   { '[d',        vim.diagnostic.goto_prev },
  --   { ']d',        vim.diagnostic.goto_next },
  --   { '<leader>e', vim.diagnostic.open_float },
  --   { '<leader>q', vim.diagnostic.setloclist },
  --   { '<c-space>', desc = 'Incremental selection' },
  --   { '<bs>',      desc = 'Decremental selection ' }
  -- },
  config = function()
    require('nvim-treesitter.configs').setup {
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
        move = {            -- Jump between textobjects
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
      }--,
      -- disable = function(_, buf)
      --   local max_filesize = 100 * 1024 -- 100 KB
      --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      --   if ok and stats and stats.size > max_filesize then
      --     return true
      --   end
      -- end
    }
  end
}
