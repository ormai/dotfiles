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
          max_line_length = "80"
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

return {
  'neovim/nvim-lspconfig',
  -- event = 'BufReadPost',
  dependencies = {
    { 'williamboman/mason.nvim', cmd = 'Mason', opts = {} },
    {
      'williamboman/mason-lspconfig.nvim',
      opts = { automatic_installation = true }
    },
    'nvim-telescope/telescope.nvim'
  },
  config = function()
    --require 'lspconfig.ui.windows'.default_options.border = 'rounded'
    local lspconfig = require 'lspconfig';

    require 'mason-lspconfig'.setup_handlers {
      function(server)
        local telescope = require 'telescope.builtin'
        lspconfig[server].setup {
          capabilities = vim.tbl_deep_extend('force',
            vim.lsp.protocol.make_client_capabilities(),
            require 'cmp_nvim_lsp'.default_capabilities()
          ),
          on_attach = function(client, bufnr)
            vim.keymap.set('n', 'gd', telescope.lsp_definitions,
              { buffer = bufnr, desc = 'LSP: go to definition' })
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,
              { buffer = bufnr, desc = 'LSP: go to declaration' })
            vim.keymap.set('n', 'gI', telescope.lsp_implementations,
              { buffer = bufnr, desc = 'LSP: go to implementation' })
            vim.keymap.set('n', 'gtd', telescope.lsp_type_definitions,
              { buffer = bufnr, desc = 'LSP: go to type definition' })
            vim.keymap.set('n', 'grr', telescope.lsp_references,
              { buffer = bufnr, desc = 'LSP: references' })
            vim.keymap.set('n', '<leader>ds', telescope.lsp_document_symbols,
              { buffer = bufnr, desc = 'LSP: document symbols' })
            vim.keymap.set('n', '<leader>ws',
              telescope.lsp_dynamic_workspace_symbols,
              { buffer = bufnr, desc = 'LSP: workspace symbols' })
            vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder,
              { buffer = bufnr, desc = 'LSP: add workspace folder' })
            vim.keymap.set('n', '<leader>wr', vim.lsp.buf
              .remove_workspace_folder,
              { buffer = bufnr, desc = 'LSP: remove workspace folder' })
            vim.keymap.set('n', '<leader>wl',
              function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
              end,
              { buffer = bufnr, desc = 'LSP: list workspace folders' })
            vim.keymap.set('n', '<leader>f', vim.lsp.buf.format,
              { buffer = bufnr, desc = 'LSP: format' })

            if client then
              if client.server_capabilities.inlayHintProvider then
                vim.keymap.set('n', '<leader>ih',
                  function()
                    vim.lsp.inlay_hint.enable(
                      not vim.lsp.inlay_hint.is_enabled())
                  end,
                  { buffer = bufnr, desc = 'LSP: toggle inlay-hints' })
              end

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
          end,
          settings = servers[server],
          filetypes = (servers[server] or {}).filetypes
        }
      end,

      lspconfig.jdtls.setup {
        root_dir = function()
          return lspconfig.util.root_pattern('pom.xml',
            'gradle.build', '.idea', '.mvn', '.git') or vim.fn.getcwd()
        end
      }
    }
  end
}
