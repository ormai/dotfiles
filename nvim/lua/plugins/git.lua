return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = 'nvim-lua/plenary.nvim',
  opts = {
    signs = {
      untracked = { text = '' },
    },
    max_file_length = 2000,
    on_attach = function(bufnr)
      local gs = require 'gitsigns'

      vim.keymap.set('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gs.nav_hunk 'next'
        end
      end, { buffer = bufnr, desc = 'Git: go to next change' })

      vim.keymap.set('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gs.nav_hunk 'prev'
        end
      end, { desc = 'Git: go to previous change' })

      vim.keymap.set('v', '<leader>hs', function()
        gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Git: stage hunk' })

      vim.keymap.set('v', '<leader>hr', function()
        gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Git: reset hunk' })
      vim.keymap.set('n', '<leader>sh', gs.stage_hunk,
        { desc = 'Git: stage hunk' })
      vim.keymap.set('n', '<leader>rh', gs.reset_hunk,
        { desc = 'Git: reset hunk' })
      vim.keymap.set('n', '<leader>sb', gs.stage_buffer,
        { desc = 'Git: stage buffer' })
      vim.keymap.set('n', '<leader>uh', gs.undo_stage_hunk,
        { desc = 'Git: unstage hunk' })
      vim.keymap.set('n', '<leader>rb', gs.reset_buffer,
        { desc = 'Git: reset buffer' })
      vim.keymap.set('n', '<leader>vh', gs.preview_hunk,
        { desc = 'Git: preview hunk' })
      vim.keymap.set('n', '<leader>bl', gs.blame_line,
        { desc = 'Git: blame line' })
      vim.keymap.set('n', '<leader>dt', gs.diffthis,
        { desc = 'Git: diff against index' })
      vim.keymap.set('n', '<leader>dtc', function()
        gs.diffthis '@'
      end, { desc = 'Git: diff against last commit' })
      vim.keymap.set('n', '<leader>lb', gs.toggle_current_line_blame,
        { desc = 'Git: toggle blame for line' })
      vim.keymap.set('n', '<leader>tD', gs.toggle_deleted,
        { desc = 'Git: toggle deleted' })
    end,
  }
}
