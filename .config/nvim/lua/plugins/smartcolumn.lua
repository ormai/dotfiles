return {
  "m4xshen/smartcolumn.nvim",
  lazy = true, -- only after tree-sitter
  opts = {
    colorcolumn = "80",
    -- scope = "line",
    disabled_filetypes = {
      "man",
      "toggleterm",
      "tex",
      "lazy",
      "mason",
      "lspinfo"
    },
  },
}
