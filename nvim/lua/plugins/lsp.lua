local servers = { -- configured servers
  "clangd",
  "pyright",
  "lua_ls",
  "cssls",
  "html",
  "bashls",
  "asm_lsp"
}

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { -- To install servers
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup({
          ui = {
            border = "rounded", -- nice
            width = 0.6,
            height = 0.7,
          }
        })
      end
    },
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("mason-lspconfig").setup({
          ensure_installed = servers,
          automatic_installation = false,
        })
      end
    },
  },
  config = function()
    local on_attach = function(_, bufnr)
      local key = vim.keymap.set

      key("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "[R]e[n]ame" })
      key("n", "<leader>ca", vim.lsp.buf.code_action, {buffer = bufnr, desc = "[C]ode [A]ction" })

      key("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "[G]oto [D]efinition" })
      key("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "[G]oto [I]mplementation" })

      key("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover Documentation" })
      key("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Documentation" })

      key("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "[G]oto [D]eclaration" })
      key("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Type Definition" })
      key("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { buffer = bufnr, desc = "[W]orkspace [A]dd Folder" })
      key("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { buffer = bufnr, desc = "[W]orkspace [R]emove Folder" })
      key("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, { buffer = bufnr, desc = "[W]orkspace [L]ist Folders" })

      vim.api.nvim_buf_create_user_command(bufnr, "Format", vim.lsp.buf.format or vim.lsp.buf.formatting, { desc = "Format current buffer with LSP" })
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Apply capabilities to each language server
    require("mason-lspconfig").setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
        }
      end,
    }
  end
}
