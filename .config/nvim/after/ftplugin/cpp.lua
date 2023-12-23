vim.keymap.set(
  'n',
  '<leader>make',
  ":TermExec cmd='make %:r && ./%:r'<CR>"
)
