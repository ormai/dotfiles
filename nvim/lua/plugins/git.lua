return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = 'nvim-lua/plenary.nvim',
  opts = {
    signs = { untracked = { text = '' } },
    max_file_length = 2000,
    on_attach = function()
      local g = require 'gitsigns'
      keymap(']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          g.nav_hunk 'next'
        end
      end, 'Git: go to next change')
      keymap('[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          g.nav_hunk 'prev'
        end
      end, 'Git: go to previous change')
      keymap('<Space>hs', function() g.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, 'Git: reset hunk')
      keymap('<Space>sh', g.stage_hunk, 'Git: stage hunk')
      keymap('<Space>rh', g.reset_hunk, 'Git: reset hunk')
      keymap('<Space>sb', g.stage_buffer, 'Git: stage buffer')
      keymap('<Space>uh', g.undo_stage_hunk, 'Git: unstage hunk')
      keymap('<Space>rb', g.reset_buffer, 'Git: reset buffer')
      keymap('<Space>vh', g.preview_hunk, 'Git: preview hunk')
      keymap('<Space>bl', g.blame_line, 'Git: blame line')
      keymap('<Space>dt', g.diffthis, 'Git: diff against index')
      keymap('<Space>dtc', function() g.diffthis '@' end, 'Git: diff against latest commit')
      keymap('<Space>lb', g.toggle_current_line_blame, 'Git: toggle blame on current line')
      keymap('<Space>tD', g.toggle_deleted, 'Git: toggle deleted')
    end,
  }
}
