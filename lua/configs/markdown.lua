vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { buffer = true, desc = "Preview Markdown" })
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { buffer = true, desc = "Open note in Obsidian app" })
    vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { buffer = true, desc = "New Obsidian note" })
    vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianToday<CR>", { buffer = true, desc = "Today’s daily note" })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.conceallevel = 2
    vim.opt.concealcursor = "nc"
  end,
})
