return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function ()
      require("ibl").setup({
        whitespace = { highlight = { "Whitespace", "NonText" } },
        debounce = 100
      })
    end
  }
}
