vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.spell = true

vim.keymap.set('n', '<space>c', function()
  vim.fn.system('pdflatex' .. vim.fn.expand('%') .. ' >/dev/null 2>&1 &')
end, { silent = true })
