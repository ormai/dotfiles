vim.diagnostic.config {
  severity_sort = true,
  float = { source = 'if_many' },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚',
      [vim.diagnostic.severity.WARN] = '󰀪',
      [vim.diagnostic.severity.HINT] = '󰌶',
      [vim.diagnostic.severity.INFO] = '󰋽',
    }
  },
  virtual_text = {
    source = 'if_many',
    spacing = 2,
  }
}
