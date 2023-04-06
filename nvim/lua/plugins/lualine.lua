return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = "kyazdani42/nvim-web-devicons",
  config = function()
    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " " },
      colored = false,
      update_in_insert = false,
      always_visible = true,
    }

    local diff = {
      "diff",
      colored = true,
      symbols = { added = " ", modified = " ", removed = " " },
    }

    local filetype = {
      "filetype",
      icons_enabled = true,
    }

    local branch = {
      "branch",
      icons_enabled = true,
      icon = "",
    }

    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = "gruvbox",
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = {
          "toggleterm",
          -- "help",
          -- "man"
        },
        always_divide_middle = false,
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { branch, diff },
        lualine_c = { diagnostics },
        lualine_x = { "filename", "fileformat" },
        lualine_y = { filetype, "encoding" },
        lualine_z = { "location", "progress" },
      },
    }
  end
}
