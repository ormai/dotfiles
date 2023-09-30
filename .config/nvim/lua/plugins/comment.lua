return {
  "numToStr/Comment.nvim",
  keys = {
    -- Only in NORMAL
    "gcc", -- toggle line comment
    "gcb", -- toggle block comment
    "gco", -- insert comment below
    "gcO", -- insert comment above
    "gcA", -- insert comment at EOL

    { "gc", mode = { "n", "x" } },
    { "gb", mode = { "n", "x" } }
  },
  config = true,
}
