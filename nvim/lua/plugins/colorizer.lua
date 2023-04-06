return  {
  "norcalli/nvim-colorizer.lua",
  cmd = {
    "ColorizerAttachToBuffer",
    "ColorizerToggle"
  },
  config = function()
    require("colorizer").setup({
      "css";
      "javascript";
      "rasi";
      "scss"
    })
  end
}
