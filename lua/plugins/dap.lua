return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db",     ":lua require'dap'.toggle_breakpoint()<CR>", silent = true, desc = "Debug Toggle Breakpoint" },
      { "<leader>dw",     ":lua require'dap.ui.widgets'.hover()<CR>", silent = true, desc = "Debug Widget Hover" },
      { "<leader>df",     ":lua require'dap.ui.widgets'.centered_float(require'dap.ui.widgets'.scopes)<CR>", silent = true, desc = "Debug Widget Scopes" },
      { "<F5>",     ":lua require'dap'.continue()<CR>", silent = true, desc = "Debug Continue" },
      { "<F8>",     ":lua require'dap'.step_over()<CR>", silent = true, desc = "Debug Step Over" },
      { "<F7>",     ":lua require'dap'.step_into()<CR>", silent = true, desc = "Debug Step Into" },
      { "<S-F8>",     ":lua require'dap'.step_out()<CR>", silent = true, desc = "Debug Step Out" },
      { "<leader>dt",     ":lua require'dapui'.toggle()<CR>", silent = true, desc = "Dap Ui toggle" },
      { "<leader>dr",     ":lua require'dapui'.float_element('repl', {'enter'})<CR>", silent = true, desc = "Dap Ui repl" },
      vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
    },
    config = function ()
      local dap = require('dap')
      dap.configurations.java = {
        {
          type = 'java',
          name = 'Integration',
          request = 'launch',
          main = '',
          console = 'internalConsole',
          args = "${command:SpecifyProgramArgs}",
          vmArgs = "-Dspring.profiles.active=integration"
        },
        {
          type = 'java',
          name = 'local',
          request = 'launch',
          main = '',
          console = 'internalConsole',
          args = "${command:SpecifyProgramArgs}",
          vmArgs = "-Dspring.profiles.active=local"
        },
        {
          type = 'java',
          name = 'test',
          request = 'launch',
          main = '',
          console = 'internalConsole',
          args = "${command:SpecifyProgramArgs}",
          vmArgs = "-Dspring.profiles.active=test"
        },
      }
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
    config = function ()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup({})
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end
  },
  {
    "folke/neodev.nvim",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
    config = function ()
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true }
      })
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function ()
      require("nvim-dap-virtual-text").setup()
    end

  }

}
