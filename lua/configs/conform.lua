local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = { "ruff_format" }, -- 🐍 Python
    cpp = { "clang_format" }, -- 💻 C++
    c = { "clang_format" }, -- 💻 C
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
