local group = vim.api.nvim_create_augroup('config', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function() vim.hl.on_yank { timeout = 500 } end,
  group = group,
})

-- https://www.reddit.com/r/neovim/comments/1abd2cq/comment/kjo7moz/
-- :h last-position-jump
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    vim.api.nvim_win_set_cursor(0, vim.api.nvim_buf_get_mark(0, '"'))
  end,
  group = group,
  desc = 'Open file at last edit position',
})

vim.api.nvim_create_autocmd(
  { 'BufLeave', 'FocusLost', 'InsertLeave', 'TextChanged' },
  {
    callback = function(e)
      if vim.bo[e.buf].modifiable and vim.bo[e.buf].modified then
        vim.schedule(function() vim.cmd 'silent! write' end)
      end
    end,
    group = group,
    desc = 'Save buffer automatically'
  }
)
