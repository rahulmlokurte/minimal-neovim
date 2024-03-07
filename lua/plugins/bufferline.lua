return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      {"<S-S>", "<cmd>BufferLinePick<cr>", desc = "Pick buffer"}
    },
    config = function()
      vim.opt.termguicolors = true
      local bufferline = require("bufferline")
      bufferline.setup{
        options = {
          mode = "buffers",
          style_preset = bufferline.style_preset.default,
          numbers = "ordinal",
          buffer_close_icon = '󰅖',
          modified_icon = '●',
          close_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          indicator = {
            style = "underline"
          },
          highlights = require("catppuccin.groups.integrations.bufferline").get()
        }
      }
    end
  }
}
