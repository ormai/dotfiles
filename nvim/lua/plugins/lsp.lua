local servers = { -- configured servers with settings
  tsserver = {
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true
      }
    },
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true
      }
    }
  },
  lua_ls = {
    Lua = {
      hint = {
        enable = true,
        setType = true,
      },
      diagnostics = {
        globals = { 'vim' },
        neededFileStatus = {
          ['codestyle-check'] = 'Any'
        }
      },
      format = {
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
          -- max_line_length = "80"
        }
      }
    }
  },
  jdtls = {
    java = {
      redhat = { telemetry = { enabled = { false } } },
    }
  }
}

local function inlay_hints(client)
  if client.server_capabilities.inlayHintProvider then
    keymap('<Space>ih', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, 'LSP: toggle inlay hints')
  end
end

local function highlight_current_symbol(client, bufnr)
  if client.server_capabilities.documentHighlightProvider then
    local highlight_references = vim.api.nvim_create_augroup(
      'highlight_references', { clear = false })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      buffer = bufnr,
      group = highlight_references,
      callback = vim.lsp.buf.document_highlight,
      desc = 'LSP: hihlight references to symbol under cursor'
    })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      buffer = bufnr,
      group = highlight_references,
      callback = vim.lsp.buf.clear_references,
      desc = 'LSP: clear references highlight'
    })
    vim.api.nvim_create_autocmd('LspDetach', {
      group = highlight_references,
      callback = function(event)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds { group = 'highlight_references', buffer = event.buf }
      end,
      desc = 'LSP: stop highlighting references.'
    })
  end
end

local function format(client, bufnr)
  keymap('<Space>f', vim.lsp.buf.format, 'LSP: format')
  if client.supports_method 'textDocument/formatting' then
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      callback = function() vim.lsp.buf.format { bufnr = bufnr, id = client.id } end
    })
  end
end

local function create_keymaps()
  local t = require 'telescope.builtin'
  keymap('gd', t.lsp_definitions, 'LSP: go to definition')
  keymap('gD', vim.lsp.buf.declaration, 'LSP: go to declaration')
  keymap('gI', t.lsp_implementations, 'LSP: go to implementation')
  keymap('gtd', t.lsp_type_definitions, 'LSP: go to type definition')
  keymap('grr', t.lsp_references, 'LSP: references')
  keymap('<leader>ds', t.lsp_document_symbols, 'LSP: document symbols')
  keymap('<leader>ws', t.lsp_dynamic_workspace_symbols, 'LSP: workspace symbols')
  keymap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'LSP: add workspace folder')
  keymap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'LSP: remove workspace folder')
  keymap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'LSP: list workspace folders')
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', cmd = 'Mason', opts = {} },
    'williamboman/mason-lspconfig.nvim',
    'nvim-telescope/telescope.nvim',
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "luvit-meta/library", words = { "vim%.uv" } }
        }
      }
    }
  },
  config = function()
    local config = require 'lspconfig';
    require 'mason-lspconfig'.setup_handlers {
      function(server)
        config[server].setup {
          capabilities = vim.tbl_deep_extend('force',
            vim.lsp.protocol.make_client_capabilities(),
            require 'blink.cmp'.get_lsp_capabilities(config[server].capabilities)
          ),
          on_attach = function(client, bufnr)
            create_keymaps(bufnr)
            if client then
              inlay_hints(client)
              highlight_current_symbol(client, bufnr)
              format(client, bufnr)
            end
          end,
          settings = servers[server],
          filetypes = (servers[server] or {}).filetypes
        }
      end
    }
  end
}
