return {
  "mfussenegger/nvim-jdtls",
  config = function ()
    local jdtls = require("jdtls")
    jdtls.setup_dap({hotcodereplace = 'auto'})
  end
}
