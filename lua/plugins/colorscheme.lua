return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function ()
      require("catppuccin").setup({
        transparent_background = true,
        highlight_overrides = {
          all = function ()
            return {
              CmpBorder = { fg = "#3e4145"}
            }
          end
        },
        integrations = {
          cmp = true,
          treesitter = true,
          noice = true,
          telescope = {
            enabled = true,
          },
          symbols_outline = true,
          which_key = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
        }
      })
      vim.cmd.colorscheme "catppuccin"
    end
  }
}
