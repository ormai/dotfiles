local servers = { -- configured servers with settings
  tsserver = {
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
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
        includeInlayParameterNameHints = "all",
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
  clangd = {},
  pyright = {},
  cssls = {},
  html = {},
  bashls = {},
  lua_ls = {
    Lua = { -- https://luals.github.io/wiki/settings/
      workspace = { checkThirdParty = false },
      hint = { enabled = true }
    }
  }
}

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    { -- To install servers
      "williamboman/mason.nvim",
      opts = {
        ui = {
          border = "rounded", -- nice
          width = 0.6,
          height = 0.7,
        }
      }
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = true
      }
    }
  },

  config = function()
    local on_attach = function(_, bufnr)
      local buf = vim.lsp.buf
      local telescope = require("telescope.builtin")
      local k = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
      end

      k("<leader>rn", buf.rename,                  "rename buffer")
      k("<leader>ca", buf.code_action,             "code actions")
      k("gd",         buf.definition,              "go to definition")
      k("gi",         buf.implementation,          "go to implementation")
      k("K",          buf.hover,                   "hover documentation")
      k("<C-k>",      buf.signature_help,          "signature documentation")
      k("gD",         buf.declaration,             "go to declaration")
      k("<leader>D",  buf.type_definition,         "type definition")
      k("<leader>wa", buf.add_workspace_folder,    "add workspace folder")
      k("<leader>wr", buf.remove_workspace_folder, "remove workspace folder")
      k("<leader>f",  buf.format,                  "format")

      k("<leader>r", telescope.lsp_references "list references")
      k("<leader>s", telescope.lsp_document_symbols, "list symbols")

      k("<leader>wl", function()
        print(vim.inspect(buf.list_workspace_folders()))
      end, "List workspace folders")

      vim.api.nvim_buf_create_user_command(
        bufnr,
        "Format",
        buf.format or buf.formatting,
        { desc = "LSP: format buffer" }
      )
    end

    --[[ local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts.border = {
        {"╭", "FloatBorder"},
        {"─", "FloatBorder"},
        {"╮", "FloatBorder"},
        {"│", "FloatBorder"},
        {"╯", "FloatBorder"},
        {"─", "FloatBorder"},
        {"╰", "FloatBorder"},
        {"│", "FloatBorder"},
      }
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end ]]

    vim.keymap.set(
      "n",
      "<leader>i",
      function() vim.lsp.inlay_hint(0, nil) end,
      { desc = "LSP: toggle inlay-hints" }
    )

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    require("neodev").setup() -- before lspconfig

    require("mason-lspconfig").setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
    }
  end
}
