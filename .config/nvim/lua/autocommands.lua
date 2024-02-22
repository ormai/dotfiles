-- :h vim.highlight.on_yank()
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "Highlight on yank",
  callback = function() vim.highlight.on_yank() end,
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  pattern = '*',
})

-- https://www.reddit.com/r/neovim/comments/1abd2cq/comment/kjo7moz/
-- :h last-position-jump
vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Open file at last edit position',
  group = misc_augroup,
  pattern = '*',
  command = 'silent! normal! g`"zv'
})

-- https://github.com/okuuva/auto-save.nvim/tree/main
vim.api.nvim_create_autocmd(
  { 'BufLeave', 'FocusLost', 'InsertLeave', 'TextChanged' },
  {
    callback = function(opts)
      if vim.fn.getbufvar(opts.buf, '&modifiable') == 1 then
        vim.cmd("silent! update")
      end
    end,
    desc = 'Save current buffer automatically'
  })
