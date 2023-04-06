return {
  "numToStr/Comment.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("Comment").setup({
      padding = true,    -- Add a space b/w comment and the line
      sticky = true,     -- the cursor stays at its position in normal mode
      ignore = nil,      -- Lines to be ignored while comment/uncomment.
      toggler = {        -- Toggle mappins in NORMAL + VISUAL mode
        line = "gcc",    -- Line-comment toggle keymap
        block = "gbc",   -- Block-comment toggle keymap
      },
      opleader = {       -- Operator-pending mappings in NORMAL + VISUAL mode
        line = "gc",     -- Line-comment keymap
        block = "gb",    -- Block-comment keymap
      },
      extra = {          -- Extra mappings
        above = "gcO",   -- Add comment on the line above
        below = "gco",   -- Add comment on the line below
        eol = "gcA",     -- Add comment at the end of line
      },
    })
    require("Comment.ft").set("asm", { "//%s", "{/*%s*/}" })
  end
}
