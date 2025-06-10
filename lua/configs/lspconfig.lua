-- ✅ Force inline diagnostics globally BEFORE anything else
vim.diagnostic.config {
  virtual_text = {
    prefix = "",
    spacing = 2,
  },
  virtual_lines = false,
  signs = false, -- optional: set to true if you want sign column too
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}

-- Load NvChad's default LSP configs
local default = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

-- ✅ Your LSP servers
local servers = { "html", "cssls", "pyright", "clangd" }

for _, server in ipairs(servers) do
  local opts = default

  -- Special config for clangd
  if server == "clangd" then
    opts = vim.tbl_deep_extend("force", default, {
      cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed" },
      filetypes = { "c", "cpp", "objc", "objcpp" },
    })
  end

  lspconfig[server].setup(opts)
end
