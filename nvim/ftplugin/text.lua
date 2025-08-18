vim.o.wrap = true
vim.o.linebreak = true
vim.o.spell = true

vim.keymap.set('n', '<space>c', function()
  vim.fn.system('pdflatex' .. vim.fn.expand('%') .. ' >/dev/null 2>&1 &')
end, { silent = true })
