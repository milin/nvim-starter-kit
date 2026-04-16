vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*_OUTPUT.json",
  callback = function()
    vim.bo.modifiable = true
    vim.bo.readonly = false
  end,
})
