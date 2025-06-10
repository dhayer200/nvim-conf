local dap = require "dap"

-- 🔧 Python
dap.adapters.python = {
  type = "executable",
  command = vim.fn.exepath "debugpy-adapter",
}
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return vim.fn.exepath "python3"
    end,
  },
}

-- 🔧 C++ (lldb)
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.exepath "codelldb",
    args = { "--port", "${port}" },
  },
}
dap.configurations.cpp = {
  {
    name = "Launch C++ file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}
-- for C too
dap.configurations.c = dap.configurations.cpp
