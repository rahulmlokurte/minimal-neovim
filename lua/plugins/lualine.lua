return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    require('lualine').setup {
      options = {
        theme = "catppuccin",
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename',
          {
            'buffers',
            mode = 2,
            use_mode_colors = true

          }
        },
        lualine_x = {'searchcount', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
    }
  end
}
