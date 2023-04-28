local filetypes = { -- load only on these filetypes
    "css",
    "scss",
    "html",
    "rasi"
}

return    {
    "norcalli/nvim-colorizer.lua",
    ft = filetypes,
    cmd = {
        "ColorizerAttachToBuffer",
        "ColorizerToggle"
    },
    config = function()
        require("colorizer").setup(filetypes)
    end
}
