return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      require("tokyonight").setup({
        style = "moon",
        on_colors = function (colors)
          colors.hint = colors.orange
          colors.error = "#ff0000"
        end
      })
      vim.cmd[[colorscheme tokyonight]]
    end
  }
}
