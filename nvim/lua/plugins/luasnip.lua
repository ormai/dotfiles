return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  dependencies = "rafamadriz/friendly-snippets",
  version = "<CurrentMajor>.*",           -- follow latest release.
  build = "make install_jsregexp",        -- install jsregexp (optional!).
  config = function ()
    require("luasnip.loaders.from_vscode").lazy_load()
    local ls = require("luasnip")
    -- local types = require("luasnip.util.types")
    require("snippets")

    ls.config.set_config {
      history = true, -- remember the last snippet
      updateevents = "TextChanged,TextChangedI",

      enable_autosnippets = true,
    }
  end
}
