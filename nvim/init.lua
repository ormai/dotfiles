require('keymaps')
require('options')
require('autocommands')
require('diagnostic')

vim.filetype.add({ extension = { dj = 'djot' } }) -- djot.net
vim.filetype.add({ extension = { bnf = 'bnf' } })
vim.filetype.add({ extension = { lp = 'lp' } })
vim.filetype.add({ extension = { pddl = 'scheme' } })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath })
end
vim.opt.rtp:prepend(vim.fn.stdpath('data') .. '/lazy/lazy.nvim')

require('lazy').setup('plugins', {
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

-- Remove 'Disable mouse' option from the right-click menu
vim.cmd.aunmenu('PopUp.How-to\\ disable\\ mouse')
vim.cmd.aunmenu('PopUp.-2-')
