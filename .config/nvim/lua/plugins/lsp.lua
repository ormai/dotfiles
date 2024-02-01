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
  marksman = {},
  clangd = {},
  pyright = {},
  cssls = {},
  html = {},
  bashls = {},
  lua_ls = {
    Lua = {
      hint = {
        enable = true,
        setType = true,
      },
      diagnostics = {
        globals = { 'vim' }
      }
    },
  }
}

return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },

  dependencies = {
    {
      'williamboman/mason.nvim',
      cmd = 'Mason',
      opts = {
        ui = {
          border = 'rounded', -- nice
          width = 0.6,
          height = 0.7,
        }
      }
    },
    {
      'williamboman/mason-lspconfig.nvim',
      opts = {
        automatic_installation = true
      }
    }
  },

  config = function()
    require('lspconfig.ui.windows').default_options.border = 'rounded'

    local on_attach = function(_, bufnr)
      local k = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      local buf = vim.lsp.buf
      k('<leader>rn', buf.rename, 'rename buffer')
      k('<leader>ca', buf.code_action, 'code actions')
      k('gd', buf.definition, 'go to definition')
      k('gi', buf.implementation, 'go to implementation')
      k('K', buf.hover, 'hover documentation')
      k('<C-k>', buf.signature_help, 'signature documentation')
      k('gD', buf.declaration, 'go to declaration')
      k('<leader>D', buf.type_definition, 'type definition')
      k('<leader>wa', buf.add_workspace_folder, 'add workspace folder')
      k('<leader>wr', buf.remove_workspace_folder, 'remove workspace folder')
      k('<leader>f', buf.format, 'format')

      k('<leader>wl', function()
        print(vim.inspect(buf.list_workspace_folders()))
      end, 'List workspace folders')

      vim.api.nvim_buf_create_user_command(
        bufnr,
        'Format',
        buf.format or buf.formatting,
        { desc = 'LSP: format buffer' }
      )
    end

    vim.keymap.set(
      'n',
      '<leader>i',
      function() vim.lsp.inlay_hint(0, nil) end,
      { desc = 'LSP: toggle inlay-hints' }
    )

    local capabilities = vim.tbl_deep_extend(
      'force',
      vim.lsp.protocol.make_client_capabilities(),
      require('cmp_nvim_lsp').default_capabilities()
    )

    require('mason-lspconfig').setup_handlers {
      function(server)
        require('lspconfig')[server].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server],
          filetypes = (servers[server] or {}).filetypes,
        }
      end,
    }
  end
}
