require 'auto-color-scheme'

vim.api.nvim_create_augroup('user config', { clear = true })

-- :h vim.highlight.on_yank()
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function() vim.highlight.on_yank() end,
  group = 'user config',
  desc = "Highlight on yank",
})

-- https://www.reddit.com/r/neovim/comments/1abd2cq/comment/kjo7moz/
-- :h last-position-jump
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  command = 'silent! normal! g`"zv',
  group = 'user config',
  desc = 'Open file at last edit position',
})

-- https://github.com/okuuva/auto-save.nvim/tree/main
vim.api.nvim_create_autocmd(
  { 'BufLeave', 'FocusLost', 'InsertLeave', 'TextChanged' },
  {
    callback = function(opts)
      if vim.fn.getbufvar(opts.buf, '&modifiable') == 1 then
        vim.cmd 'silent! update'
      end
    end,
    group = 'user config',
    desc = 'Save current buffer automatically'
  }
)
