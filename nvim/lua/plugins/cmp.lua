return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  enabled = false,
  dependencies = { -- https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    {
      'L3MON4D3/LuaSnip',
      lazy = true,
      dependencies = 'rafamadriz/friendly-snippets',
      version = '2.*',
      build = 'make install_jsregexp',
      config = function()
        require 'luasnip.loaders.from_vscode'.lazy_load()
        require 'snippets'
        require 'luasnip'.config.set_config {
          history = true, -- remember the last snippet
          updateevents = 'TextChanged,TextChangedI',
          enable_autosnippets = true,
        }
      end
    },
    {
      'windwp/nvim-autopairs',
      config = {}
    },
    -- {
    --   'zbirenbaum/copilot.lua',
    --   config = {
    --     suggestion = { enabled = false },
    --     panel = { enabled = false }
    --   }
    -- },
    -- {
    --   'zbirenbaum/copilot-cmp',
    --   config = {}
    -- },
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } }
        }
      }
    }
  },
  config = function()
    local icons = {
      -- Copilot = '',
      Text = '',
      Method = '󰆧',
      Function = '󰊕',
      Constructor = '',
      Field = '󰇽',
      Variable = '󰂡',
      Class = '󰠱',
      Interface = '',
      Module = '',
      Property = '󰜢',
      Unit = '',
      Value = '󰎠',
      Enum = '',
      Keyword = '󰌋',
      Snippet = '',
      Color = '󰏘',
      File = '󰈙',
      Reference = '',
      Folder = '󰉋',
      EnumMember = '',
      Constant = '󰏿',
      Struct = '',
      Event = '',
      Operator = '󰆕',
      TypeParameter = '󰅲'
    }
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    cmp.setup {
      -- enabled = vim.api.nvim_get_option_value('buftype', {}) ~= 'prompt'
      --     and vim.fn.reg_recording() == ''
      --     and vim.fn.reg_executing() == '',
      snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
      mapping = cmp.mapping.preset.insert {
        ['<c-b>'] = cmp.mapping.scroll_docs(-4),
        ['<c-f>'] = cmp.mapping.scroll_docs(4),
        ['<c-space>'] = cmp.mapping.complete {},
        -- ['<C-e>'] = cmp.mapping { i = cmp.mapping.abort() },
        -- ['<C-y>'] = cmp.mapping.confirm { select = true }
        -- ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
        { name = 'copilot ' },
        { name = 'lazydev' },
        { name = 'path' },
        { name = 'buffer' }
      },
      formatting = {
        expandable_indicator = true,
        fields = { 'kind', 'abbr', 'menu' },
        format = function(_, vim_item)
          vim_item.kind = string.format('%s ', icons[vim_item.kind])
          return vim_item;
        end
      },
      view = { docs = { auto_open = true } }
    }

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources(
        { { name = 'path' } },
        { { name = 'cmdline' } }
      ),
      matching = { disallow_symbol_nonprefix_matching = false }
    })

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = 'buffer' } }
    })

    cmp.event:on(
      'confirm_done',
      require 'nvim-autopairs.completion.cmp'.on_confirm_done()
    )
  end
}
