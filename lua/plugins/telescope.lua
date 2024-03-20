return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-dap.nvim', { 'nvim-telescope/telescope-ui-select.nvim' }
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            initial_mode = "normal",
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            layout_config = {
              horizontal = {
                width = 0.5,
                height = 0.4,
                preview_width = 0.6,
              },
            },
          }
        }
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          layout_config = {
            height = 0.5,
            width = 0.5,
            prompt_position = "top",
          }
        },
        live_grep = {
          theme = "dropdown",
          layout_config = {
            height = 0.5,
            width = 0.5,
            prompt_position = "top",
          }
        },
        buffers = {
          theme = "dropdown",
          layout_config = {
            height = 0.5,
            width = 0.5,
            prompt_position = "top",
          }
        },
        help_tags = {
          theme = "dropdown",
          layout_config = {
            height = 0.5,
            width = 0.5,
            prompt_position = "top",
          }
        }
      }
    }
    telescope.load_extension('fzf')
    telescope.load_extension('dap')
    telescope.load_extension('ui-select')
    telescope.load_extension('noice')
    local wk = require("which-key")
    wk.register({
      ["<leader>f"] = { name = "+file" },
      ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
      ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
      ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Find in Buffers" },
      ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
    })
  end
}
