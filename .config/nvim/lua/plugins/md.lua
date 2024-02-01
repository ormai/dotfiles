return {
  {
    'Beastwick18/nabla.nvim',
    ft = { 'markdown', 'tex' },
    config = function()
      require('nabla').enable_virt({
        align_center = true,
        autogen = true,
        silent = false
      })
    end
  },
  {
    'iamcco/markdown-preview.nvim', -- markdown preview plugin for (neo)vim
    ft = 'markdown'
  },
  {
    'epwalsh/obsidian.nvim',
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { "<leader>n", "<cmd>ObsidianQuickSwitch<cr>", desc = "Notes" },
      { "<leader>t", "<cmd>ObsidianToday<cr>",       desc = "Open today's journal note" }
    },
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      'BufReadPre ' .. vim.fn.expand('~') .. '/vault/**.md',
      'BufNewFile ' .. vim.fn.expand('~') .. '/vault/**.md',
    },
    opts = {
      workspaces = {
        {
          name = 'vault',
          path = '~/vault'
        }
      },

      daily_notes = { folder = "diario" },

      completion = {
        prepend_note_path = true,
      },

      disable_frontmatter = true,

      follow_url_func = function(url)
        vim.fn.jobstart({ 'xdg-open', url })
      end,

      ui = {
        checkboxes = {
          [' '] = { char = '󰄱', hl_group = 'GruvboxOrange' },
          ['x'] = { char = '󰄲', hl_group = 'GruvboxGreen' },
          ['>'] = { char = '', hl_group = 'GruvboxYellow' },
          ['~'] = { char = '󰰱', hl_group = 'GruvboxRed' },
          -- ...
        },
        external_link_icon = { char = '', hl_group = 'GruvboxPurple' },
        reference_text = { hl_group = 'GruvboxPurple' },
        highlight_text = { hl_group = 'Visual' },
        tags = { hl_group = 'GruvboxBlueBold' },
      },

      attachments = {
        img_folder = 'static'
      }
    }
  }
}
