require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local M = {}

M.dap = {
  n = {
    ["<F5>"] = {
      function()
        require("dap").continue()
      end,
      "Start Debugger",
    },
    ["<F10>"] = {
      function()
        require("dap").step_over()
      end,
      "Step Over",
    },
    ["<F11>"] = {
      function()
        require("dap").step_into()
      end,
      "Step Into",
    },
    ["<F12>"] = {
      function()
        require("dap").step_out()
      end,
      "Step Out",
    },
    ["<Leader>b"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle Breakpoint",
    },
    ["<Leader>B"] = {
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      "Conditional Breakpoint",
    },
  },
}

M.venv = {
  n = {
    ["<C-=>"] = { "<cmd>VenvSelect<CR>", "Select VirtualEnv" },
  },
}

map(
  "n",
  "<leader>tt",
  ":lua require('base46').toggle_transparency()<CR>",
  { noremap = true, silent = true, desc = "Toggle Background Transparency" }
)

return M
