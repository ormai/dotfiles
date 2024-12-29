require 'keymaps'
require 'options'
require 'autocommands'

vim.filetype.add { extension = { dj = 'djot' } } -- djot.net
vim.filetype.add { extension = { bnf = 'bnf' } }

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system { 'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath }
end
vim.opt.rtp:prepend(vim.fn.stdpath 'data' .. '/lazy/lazy.nvim')

require 'lazy'.setup('plugins', {
  change_detection = { notify = false },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip', 'matchit', 'netrwPlugin', 'tarPlugin',
        'tohtml', 'tutor', 'zipPlugin', 'rplugin', 'editorconfig', -- 'matchparen'
      }
    }
  }
})

vim.diagnostic.config {
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚',
      [vim.diagnostic.severity.WARN] = '󰀪',
      [vim.diagnostic.severity.HINT] = '󰌶',
      [vim.diagnostic.severity.INFO] = '󰋽',
    }
  }
}

vim.cmd.aunmenu 'PopUp.How-to\\ disable\\ mouse'
vim.cmd.aunmenu 'PopUp.-2-'
