vim.api.nvim_create_augroup('init.lua', { clear = true })

-- :h vim.highlight.on_yank()
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function() vim.highlight.on_yank() end,
  group = 'init.lua',
  desc = "Highlight on yank",
})

-- https://www.reddit.com/r/neovim/comments/1abd2cq/comment/kjo7moz/
-- :h last-position-jump
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  command = 'silent! normal! g`"zv',
  group = 'init.lua',
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
    group = 'init.lua',
    desc = 'Save current buffer automatically'
  }
)
