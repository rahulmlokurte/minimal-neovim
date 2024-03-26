return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "jdtls", "pyright", "marksman", "tsserver", "tailwindcss" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig"
    },
    config = function()
      require("neodev").setup({})
      local lspconfig = require("lspconfig")
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            }
          }
        },
        capabilities = lsp_capabilities,
      })

      lspconfig.gopls.setup({
        capabilities = lsp_capabilities,
      })
      lspconfig.pyright.setup({
        capabilities = lsp_capabilities
      })
      lspconfig.tsserver.setup({
        capabilities = lsp_capabilities
      })
      lspconfig.tailwindcss.setup({
        capabilities = lsp_capabilities
      })
    end
  },
}
