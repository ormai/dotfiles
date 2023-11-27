vim.keymap.set(
  'n',
  '<leader>r',
  ":TermExec cmd='make %:r && ./%:r'<CR>"
)
