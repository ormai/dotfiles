vim.keymap.set(
  'n',
  '<leader>make',
  ":TermExec cmd='make -s %:r && ./%:r'<CR>"
)
