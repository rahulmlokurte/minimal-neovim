return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db",  ":lua require'dap'.toggle_breakpoint()<CR>",                                       silent = true, desc = "Debug Toggle Breakpoint" },
      { "<leader>dw",  ":lua require'dap.ui.widgets'.hover()<CR>",                                        silent = true, desc = "Debug Widget Hover" },
      { "<leader>df",  ":lua require'dap.ui.widgets'.centered_float(require'dap.ui.widgets'.scopes)<CR>", silent = true, desc = "Debug Widget Scopes" },
      { "<F5>",        ":lua require'dap'.continue()<CR>",                                                silent = true, desc = "Debug Continue" },
      { "<F8>",        ":lua require'dap'.step_over()<CR>",                                               silent = true, desc = "Debug Step Over" },
      { "<F7>",        ":lua require'dap'.step_into()<CR>",                                               silent = true, desc = "Debug Step Into" },
      { "<S-F8>",      ":lua require'dap'.step_out()<CR>",                                                silent = true, desc = "Debug Step Out" },
      { "<leader>dt",  ":lua require'dapui'.toggle()<CR>",                                                silent = true, desc = "Toggle Dapui" },
      { "<leader>dr",  ":lua require'dapui'.open({reset = true})<CR>",                                    silent = true, desc = "Reset Dapui" },
      { "<leader>drc", ":lua require'dap'.repl.clear()",                                                  silent = true, desc = "Clear Dapui Repl" },
    },
    config = function()
      local dap = require('dap')
      local wk = require("which-key")
      wk.register({
        ["<leader>d"] = { name = "+Dap Ui" }
      })
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
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup({
        layouts = { {
          elements = { {
            id = "scopes",
            size = 0.25
          }, {
            id = "breakpoints",
            size = 0.25
          }, {
            id = "stacks",
            size = 0.25
          }, {
            id = "watches",
            size = 0.25
          } },
          position = "left",
          size = 40
        }, {
          elements = { {
            id = "repl",
            size = 1
          }, {
            id = "console",
            size = 0.0
          } },
          position = "bottom",
          size = 5
        } }
      })
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
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  }

}
