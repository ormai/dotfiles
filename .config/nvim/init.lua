
--  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
--  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
--  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
--  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
--  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
--  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

vim.loader.enable() -- experimental

require("keymaps") -- set leader before lazy
require("options")
require("autocommands")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest|stable|release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  ui = {
    border = "rounded",
  },
  change_detection = {
    notify = false, -- get a notification when changes are found
  },
})
