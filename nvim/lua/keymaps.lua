local k = vim.keymap.set -- Shorten function name

-- set the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

k("", "<Space>", "<Nop>") -- unbind <space> as it is the leader key

-- Move around buffers
k('n', '<C-h>', '<C-w>h', { silent = true, desc = '[] Go to left buffer' })
k('n', '<C-j>', '<C-w>j', { silent = true,  desc = '[] Go to bottom buffer' })
k('n', '<C-k>', '<C-w>k', { silent = true, desc = '[] Go to top buffer' })
k('n', '<C-l>', '<C-w>l', { silent = true, desc = '[] Go to right buffer' })

-- Resize with arrows
k('n', '<C-Up>', ':resize -2<CR>', { silent = true, desc = 'Reduce buffer height' })
k('n', '<C-Down>', ':resize +2<CR>', { silent = true, desc = 'Increase buffer height' })
k('n', '<C-Left>', ':vertical resize -2<CR>', { silent = true, desc = 'Reduce buffer width' })
k('n', '<C-Right>', ':vertical resize +2<CR>', { silent = true, desc = 'Increase buffer width' })


-- Move text up and down
k('n', '<A-j>', '<Esc>:m .+1<CR>', { silent = true, desc = '[ﲔ] Move line down' })
k('n', '<A-k>', '<Esc>:m .-2<CR>', { silent = true,  desc = '[ﲗ] Move line up' })
k("v", "<A-j>", ":m .+1<CR>==", { silent = true, desc = '[ﲔ] Move line down' })
k("v", "<A-k>", ":m .-2<CR>==", { silent = true, desc = '[ﲗ] Move line up' })
k("x", "J", ":move '>+1<CR>gv-gv", { desc = 'Move line down' })
k("x", "K", ":move '<-2<CR>gv-gv", { desc = 'Move line up' })
k("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = 'Move line down' })
k("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = 'Move line up' })

-- Stay in indent mode
k('v', '<', '<gv', { silent = true, desc = '[<] Remove indent' })
k('v', '>', '>gv', { silent = true, desc = '[>] Add indent' })

-- Move text up and down
k("v", "p", '"_dP')

-- dd on an empty line doesn't overwire the clipboard
local function enhanced_dd()
    local line_data = vim.api.nvim_win_get_cursor(0)
    local current_line = vim.api.nvim_buf_get_lines(0, line_data[1]-1, line_data[1], false)
    if current_line[1] == "" then
        return '"_dd'
    else
        return 'dd'
    end
end
k("n", "dd", enhanced_dd, { noremap = true, expr = true } );

--- ToggleTerm
k("n", "<leader>p", ":TermExec cmd='python '%:.'<CR>", { desc = "Run the current file as a Python script" })
k("n", "<leader>a", ":TermExec cmd='asm run %:.'<CR>", { desc = "Assembly and run the current file" })

function _G.set_terminal_ks()
    local opts = {buffer = 0}
    k('t', '<esc>', [[<C-\><C-n>]], opts)
    k('t', 'jk', [[<C-\><C-n>]], opts)
    k('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    k('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    k('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    k('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    k('t', '<C-t>', [[<Cmd>ToggleTerm<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_ks()")
