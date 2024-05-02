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
      local gitsigns = require 'gitsigns'

      vim.keymap.set('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { buffer = bufnr, desc = 'Git: go to next change' })
      vim.keymap.set('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Git: go to previous change' })
      vim.keymap.set('v', '<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Git: stage hunk' })
      vim.keymap.set('v', '<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Git: reset hunk' })
      vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk,
        { desc = 'Git: stage hunk' })
      vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk,
        { desc = 'Git: reset hunk' })
      vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer,
        { desc = 'Git: stage buffer' })
      vim.keymap.set('n', '<leader>hu', gitsigns.undo_stage_hunk,
        { desc = 'Git: unstage hunk' })
      vim.keymap.set('n', '<leader>hR', gitsigns.reset_buffer,
        { desc = 'Git: reset buffer' })
      vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk,
        { desc = 'Git: preview hunk' })
      vim.keymap.set('n', '<leader>hb', gitsigns.blame_line,
        { desc = 'Git: blame line' })
      vim.keymap.set('n', '<leader>hd', gitsigns.diffthis,
        { desc = 'Git: diff against index' })
      vim.keymap.set('n', '<leader>hD', function()
        gitsigns.diffthis '@'
      end, { desc = 'Git: diff against last commit' })
      vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame,
        { desc = 'Git: toggle blame for line' })
      vim.keymap.set('n', '<leader>tD', gitsigns.toggle_deleted,
        { desc = 'Git: toggle deleted' })
    end,
  }
}
