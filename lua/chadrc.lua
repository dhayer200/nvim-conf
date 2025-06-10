-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "nord",
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

-- polish = function()
--   -- ✅ Inline diagnostics fix (works in NvChad)
--   vim.defer_fn(function()
--     vim.diagnostic.config {
--       virtual_text = {
--         prefix = "●",
--         spacing = 2,
--       },
--       virtual_lines = false,
--       signs = false, -- set to true if you want gutter signs too
--       underline = true,
--       update_in_insert = false,
--       severity_sort = true,
--     }
--   end, 100)

-- ✅ Black background override (optional, comment if not needed)
-- vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
--
-- ✅ nvim-dap keymaps
-- local dap = require "dap"
-- vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP Continue" })
-- vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
-- vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
-- vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })
-- vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
-- vim.keymap.set("n", "<Leader>B", function()
--   dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
-- end, { desc = "DAP Conditional Breakpoint" })
--end
return M
