local function inlay_hints(client, bufnr)
  vim.lsp.inlay_hint.enable(true)
  if client:supports_method(client.server_capabilities.inlayHintProvider, bufnr) then
    Keymap('<space>ih', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
    end, 'LSP: toggle inlay hints')
  end
end

local function highlight_current_symbol(client, bufnr)
  if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, bufnr) then
    local group = vim.api.nvim_create_augroup('highlight-references',
      { clear = false })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      buffer = bufnr,
      group = group,
      callback = vim.lsp.buf.document_highlight,
      desc = 'LSP: hihlight references of symbol under cursor'
    })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      buffer = bufnr,
      group = group,
      callback = vim.lsp.buf.clear_references,
      desc = 'LSP: clear references highlight'
    })
    vim.api.nvim_create_autocmd('LspDetach', {
      group = group,
      callback = function(event)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds {
          group = group,
          buffer = event.buf
        }
      end,
      desc = 'LSP: stop highlighting references.'
    })
  end
end

local function create_keymaps()
  local t = require 'telescope.builtin'
  Keymap('gd', t.lsp_definitions, 'LSP: go to definition')
  Keymap('gD', vim.lsp.buf.declaration, 'LSP: go to declaration')
  Keymap('gri', t.lsp_implementations, 'LSP: go to implementation')
  Keymap('gtd', t.lsp_type_definitions, 'LSP: go to type definition')
  Keymap('grr', t.lsp_references, 'LSP: references')
  Keymap('gO', t.lsp_document_symbols, 'LSP: document symbols')
  Keymap('<space>ws', t.lsp_dynamic_workspace_symbols, 'LSP: workspace symbols')
  Keymap('<space>wa', vim.lsp.buf.add_workspace_folder,
    'LSP: add workspace folder')
  Keymap('<space>wr', vim.lsp.buf.remove_workspace_folder,
    'LSP: remove workspace folder')
  Keymap('<space>wl',
    function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
    'LSP: list workspace folders')
  Keymap('<space>f', vim.lsp.buf.format, 'LSP: format file')
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach-hooks', { clear = true }),
  callback = function(event)
    create_keymaps()
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client then
      highlight_current_symbol(client, event.buf)
      inlay_hints(client, event.buf)
    end
  end
})

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim',           cmd = 'Mason', opts = {} },
    { 'williamboman/mason-lspconfig.nvim', opts = {} },
    'nvim-telescope/telescope.nvim',
    { "j-hui/fidget.nvim", opts = {} },
    'saghen/blink.cmp',
  },
}
