return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = 'nvim-lua/plenary.nvim',
  opts = {
    signs = { untracked = { text = '' } },
    max_file_length = 2000,
    on_attach = function()
      local g = require 'gitsigns'
      Keymap(']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          g.nav_hunk 'next'
        end
      end, 'Git: go to next change')
      Keymap('[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          g.nav_hunk 'prev'
        end
      end, 'Git: go to previous change')
      Keymap('<Space>hs',
        function() g.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end,
        'Git: reset hunk')
      Keymap('<Space>sh', g.stage_hunk, 'Git: stage hunk')
      Keymap('<Space>rh', g.reset_hunk, 'Git: reset hunk')
      Keymap('<Space>sb', g.stage_buffer, 'Git: stage buffer')
      Keymap('<Space>uh', g.undo_stage_hunk, 'Git: unstage hunk')
      Keymap('<Space>rb', g.reset_buffer, 'Git: reset buffer')
      Keymap('<Space>vh', g.preview_hunk, 'Git: preview hunk')
      Keymap('<Space>bl', g.blame_line, 'Git: blame line')
      Keymap('<Space>dt', g.diffthis, 'Git: diff against index')
      Keymap('<Space>dtc', function() g.diffthis '@' end,
        'Git: diff against latest commit')
      Keymap('<Space>lb', g.toggle_current_line_blame,
        'Git: toggle blame on current line')
      Keymap('<Space>tD', g.toggle_deleted, 'Git: toggle deleted')
    end,
  }
}
