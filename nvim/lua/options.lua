vim.o.title = true
vim.o.titlestring = '%{v:progname} %f %h'
vim.o.termguicolors = true
vim.o.clipboard = 'unnamedplus'
vim.o.fileencoding = 'utf-8'
vim.o.mouse = 'a'
vim.o.spelllang = 'en,it'
vim.o.wrap = false

vim.o.laststatus = 3
vim.o.cmdheight = 0
vim.o.showcmdloc = 'statusline'
vim.o.showmode = false

vim.o.pumheight = 8
vim.o.completeopt = 'menu,menuone,noinsert,preview'

vim.o.list = true
vim.o.listchars = 'trail:-,tab:  '
vim.o.fillchars = 'eob: ,foldopen:⌄,foldsep:│,foldclose:›'
vim.o.conceallevel = 2

vim.o.signcolumn = 'yes'
vim.o.number = true
vim.o.relativenumber = false
vim.o.cursorline = true
vim.o.cursorlineopt = 'number'

vim.o.history = 1000
vim.o.backup = true
vim.o.backupdir = vim.fn.stdpath('state') .. 'backup/'
vim.o.undofile = true
vim.o.updatetime = 200

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.smartindent = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.foldcolumn = 'auto:9'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0

vim.g.man_hardwrap = 0
