return {
  -- Autocompletion
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    -- Adds LSP completion capabilities
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",

    -- Adds a number of user-friendly snippets
    "rafamadriz/friendly-snippets",

    -- Adds vscode-like pictograms
    "onsails/lspkind.nvim",
  },

  config = function()
    vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
    require('luasnip.loaders.from_vscode').lazy_load()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local select_opts = { behavior = cmp.SelectBehavior.Select }
    vim.api.nvim_set_hl(0, "MyPmenuSel", { bg = "#a6e3a1", fg = "Black", bold = true, italic = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbr", { bg = "NONE", fg = "#cdd6f4", bold = true, italic = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#fab387", bold = true, italic = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { bg = "NONE", fg = "#cba6f7", bold = true, italic = true })
    vim.api.nvim_set_hl(0, "MyFloatBorder", { bg = "NONE", fg = "#f38ba8", bold = true, italic = true })
    vim.api.nvim_set_hl(0, "MyPmenu", { bg = "NONE", fg = "#b4befe", bold = true, italic = true })
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'buffer',   keyword_length = 3 },
        { name = 'luasnip',  keyword_length = 2 },
      },
      window = {
        completion = cmp.config.window.bordered(
          {
            winhighlight = "Normal:MyPmenu,FloatBorder:MyFloatBorder,CursorLine:MyPmenuSel,Search:None",
          }
        ),
        documentation = cmp.config.window.bordered({
          winhighlight = "Normal:MyPmenu,FloatBorder:MyFloatBorder,CursorLine:MyPmenuSel,Search:None",
        })
      },
      formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
          local menu_icon = {
            nvim_lsp = 'λ',
            luasnip = '⋗',
            buffer = 'Ω',
            path = '🖫',
          }

          item.menu = menu_icon[entry.source.name]
          return item
        end,
      },
      mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        ['<C-Space>'] = cmp.mapping.complete(),

        ['<C-f>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<C-b>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<Tab>'] = cmp.mapping(function(fallback)
          local col = vim.fn.col('.') - 1

          if cmp.visible() then
            cmp.select_next_item(select_opts)
          elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            fallback()
          else
            cmp.complete()
          end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item(select_opts)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
    })
  end
}
