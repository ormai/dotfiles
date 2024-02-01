-- :help vim.highlight.on_yank()
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "Highlight on yank",
	callback = function() vim.highlight.on_yank() end,
	group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
	pattern = '*',
})

-- https://www.reddit.com/r/neovim/comments/1abd2cq/comment/kjo7moz/
-- :help last-position-jump
vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Open file at last edit position',
  group = misc_augroup,
  pattern = '*',
  command = 'silent! normal! g`"zv'
})
