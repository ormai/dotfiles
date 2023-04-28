local options = {
    termguicolors = true,                       -- 24-bit RGB color
    background = "dark",                        -- Dark and light mode switch
    laststatus = 3,                             -- global status line
    cmdheight = 1,                              -- height of the command line
    pumheight = 10,                             -- pop up menu height
    signcolumn = "yes",                         -- always show the sign column
    showmode = false,                           -- don't show mode on cmd line

    conceallevel = 0,                           -- so that `` is visible in markdown files
    list = true,                                -- enable list mode
    lcs = "eol:↴,space:⋅,lead: ,trail:-",       -- specify characters for list ^
    cursorline = true,                          -- highlight the current line
    number = true,                              -- show line numbers
    numberwidth = 1,                            -- with of the numbers column

    backup = false,                             -- creates a backup file
    writebackup = true,                         -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    undofile = true,                            -- save undo history

    clipboard = "unnamedplus",                  -- global clipboard
    completeopt = "menuone,noselect",           -- better experience with cmp
    fileencoding = "utf-8",                     -- the encoding written to a file
    hlsearch = true,                            -- highlight while searching
    ignorecase = true,                          -- ignore case in search patterns
    smartcase = true,                           -- smart case
    mouse = "a",                                -- enable mouse mode
    smartindent = true,                         -- make indenting smarter again
    splitbelow = true,                          -- force all horizontal splits to go below current window
    splitright = true,                          -- force all vertical splits to go to the right of current window
    swapfile = false,                           -- creates a swapfile
    timeoutlen = 1000,                           -- (ms) time to complete typing
    updatetime = 250,                           -- (ms) time to save swap file

    expandtab = true,                           -- convert tabs to spaces
    tabstop = 4,                                -- insert 2 spaces for a tab
    shiftwidth = 4,                             -- size of indentation
    relativenumber = false,
    wrap = false,                               -- nowrap

    scrolloff = 10,                             -- line offset when scrolling
    sidescrolloff = 10,                         -- same but for line scroll
    foldmethod = "marker",                      -- folds are created by markers
    spell = false,                               -- spell checking
    spelllang = { "it", "en" },
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- vim.cmd("set whichwrap+=<,>,[,],h,l")
-- vim.cmd("set iskeyword+=-")
