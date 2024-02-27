return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "meuter/lualine-so-fancy.nvim",
  },
  enabled = true,
  lazy = false,
  config = function()
    require("lualine").setup({
      option = {
        theme = "sonokai"
      }
    })
  end
}
