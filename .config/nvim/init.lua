require('keymaps') -- set leader before lazy
require('options')
require('autocommands')

vim.filetype.add({ extension = { dj = "djot" } }) -- djot.net

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest|stable|release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
  defaults = { lazy = true },
  ui = { border = 'rounded' },
  change_detection = { notify = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "rplugin",
        "editorconfig",
        "matchparen"
      }
    }
  }
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

vim.diagnostic.config({ severity_sort = true })
