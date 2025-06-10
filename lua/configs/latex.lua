-- Minimal conceal settings (Gilles-style light)
vim.g.vimtex_syntax_conceal = {
  accents = 0,
  ligatures = 0,
  math_bounds = 0, -- Show \[ \], \( \)
  math_delimiters = 0, -- Keep | and delimiters visible
  math_fracs = 1, -- Conceal \frac{a}{b}
  math_super_sub = 1, -- Conceal subscripts/superscripts
  math_symbols = 1, -- Show symbols like α, ∈, →
  sections = 0,
  styles = 0,
}

-- Set conceal level and cursor mode for LaTeX buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "plaintex", "latex" },
  callback = function()
    vim.opt.conceallevel = 2
    vim.opt.concealcursor = "nc"
  end,
})

-- Keymap: <leader>md → convert .tex to .md via tex2md script
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "plaintex", "latex" },
  callback = function()
    vim.keymap.set("n", "<leader>md", function()
      local texfile = vim.fn.expand "%:p"
      local tex2md = vim.fn.expand "~/.local/bin/tex2md"

      vim.fn.jobstart({ tex2md, texfile }, {
        stdout_buffered = true,
        on_stdout = function(_, data)
          if data then
            vim.notify(table.concat(data, "\n"), vim.log.levels.INFO, { title = "tex2md" })
          end
        end,
        on_stderr = function(_, data)
          if data then
            vim.notify(table.concat(data, "\n"), vim.log.levels.ERROR, { title = "tex2md ERROR" })
          end
        end,
      })
    end, { buffer = true, desc = "Export to Obsidian Markdown" })
  end,
})

vim.api.nvim_create_user_command("Tex2Md", function()
  local texfile = vim.fn.expand "%:p"
  local tex2md = vim.fn.expand "~/.local/bin/tex2md"

  vim.fn.jobstart({ tex2md, texfile }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data then
        vim.notify(table.concat(data, "\n"), vim.log.levels.INFO, { title = "Tex2md" })
      end
    end,
    on_stderr = function(_, data)
      if data then
        vim.notify(table.concat(data, "\n"), vim.log.levels.ERROR, { title = "Tex2md ERROR" })
      end
    end,
  })
end, {
  desc = "Export .tex to Obsidian .md using tex2md script",
})
