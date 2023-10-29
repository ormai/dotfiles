return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    -- https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup {
        enabled = function()
          local disabled = false
          disabled = disabled or (vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt')
          disabled = disabled or (vim.fn.reg_recording() ~= '')
          disabled = disabled or (vim.fn.reg_executing() ~= '')
          return not disabled
        end,

        preselect = types.cmp.PreselectMode.Item,

        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<C-e>'] = cmp.mapping {
            i = cmp.mapping.abort(),
          },
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },

        sources = {
          { name = 'nvim_lsp',                group_index = 1 },
          { name = 'nvim_lsp_signature_help', group_index = 2 },
          { name = 'luasnip',                 group_index = 3 },
          { name = 'path',                    group_index = 4 },
          { name = 'buffer',                  group_index = 5 },
          { name = 'calc',                    group_index = 6 },
        },

        view = {
          entries = {
            name = 'custom',
            selection_order = 'top_down',
          },
          docs = {
            auto_open = true,
          },
        },

        --[[ window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        }, ]]
      }
      -- Put () after completing the name of a function
      cmp.event:on(
        'confirm_done',
        require('nvim-autopairs.completion.cmp').on_confirm_done()
      )
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    lazy = true,
    dependencies = 'rafamadriz/friendly-snippets',
    version = '1.*',                 -- follow latest release.
    build = 'make install_jsregexp', -- install jsregexp (optional!).
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
      local ls = require('luasnip')
      -- local types = require('luasnip.util.types')
      require('snippets')

      ls.config.set_config {
        history = true, -- remember the last snippet
        updateevents = 'TextChanged,TextChangedI',

        enable_autosnippets = true,
      }
    end
  }
}
