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
  event = 'BufReadPost',
  dependencies = {
    { 'williamboman/mason.nvim', cmd = 'Mason', opts = {} },
    {
      'williamboman/mason-lspconfig.nvim',
      opts = { automatic_installation = true }
    },
    'nvim-telescope/telescope.nvim',
    { 'folke/neodev.nvim', ft = 'lua', opts = {} },
  },
  config = function()
    require 'lspconfig.ui.windows'.default_options.border = 'rounded'

    require 'mason-lspconfig'.setup_handlers {
      function(server)
        local telescope = require 'telescope.builtin'
        require 'lspconfig'[server].setup {
          capabilities = vim.tbl_deep_extend('force',
            vim.lsp.protocol.make_client_capabilities(),
            require 'cmp_nvim_lsp'.default_capabilities()
          ),
          on_attach = function(client, bufnr)
            -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'LSP: rename buffer' })
            -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'LSP: code actions' })
            vim.keymap.set('n', 'gd', telescope.lsp_definitions,
              { buffer = bufnr, desc = 'LSP: go to definition' })
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,
              { buffer = bufnr, desc = 'LSP: go to declaration' })
            vim.keymap.set('n', 'gI', telescope.lsp_implementations,
              { buffer = bufnr, desc = 'LSP: go to implementation' })
            vim.keymap.set('n', 'gtd', telescope.lsp_type_definitions,
              { buffer = bufnr, desc = 'LSP: go to type definition' })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover,
              { buffer = bufnr, desc = 'LSP: hover documentation' })
            vim.keymap.set('n', 'gr', telescope.lsp_references,
              { buffer = bufnr, desc = 'LSP: references' })
            vim.keymap.set('n', '<leader>ds', telescope.lsp_document_symbols,
              { buffer = bufnr, desc = 'LSP: document symbols' })
            vim.keymap.set('n', '<leader>ws',
              telescope.lsp_dynamic_workspace_symbols,
              { buffer = bufnr, desc = 'LSP: workspace symbols' })
            -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'LSP: signature documentation' })
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

            if client and client.server_capabilities.inlayHintProvider
                and vim.lsp.inlay_hint then
              vim.keymap.set('n', '<leader>ih',
                function()
                  vim.lsp.inlay_hint.enable(
                    not vim.lsp.inlay_hint.is_enabled(), { bufnr = bufnr })
                end,
                { buffer = bufnr, desc = 'LSP: toggle inlay-hints' })
            end

            if client
                and client.server_capabilities.documentHighlightProvider then
              vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = bufnr,
                callback = vim.lsp.buf.document_highlight,
                desc = 'Hihlight references to symbol under cursor'
              })
              vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = bufnr,
                callback = vim.lsp.buf.clear_references,
                desc = 'Clear references highlight'
              })
            end
          end,
          settings = servers[server],
          filetypes = (servers[server] or {}).filetypes,
        }
      end,

      require 'lspconfig'.jdtls.setup {
        root_dir = function()
          return require 'lspconfig'.util.root_pattern('pom.xml',
            'gradle.build', '.idea', '.mvn', '.git') or vim.fn.getcwd()
        end
      }
    }
  end
}
