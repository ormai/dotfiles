require 'keymaps'
require 'options'
require 'autocommands'
require 'auto_background'

vim.filetype.add { extension = { dj = 'djot' } } -- djot.net
vim.filetype.add { extension = { bnf = 'bnf' } }

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require 'lazy'.setup('plugins', {
  -- defaults = { lazy = true },
  ui = { border = 'rounded' },
  change_detection = { notify = false },
  install = { colorscheme = { 'default' } },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip', 'matchit', 'netrwPlugin', 'tarPlugin', 'tohtml', 'tutor',
        'zipPlugin', 'rplugin', 'editorconfig', --[['matchparen']]
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
