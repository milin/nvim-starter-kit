vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*_OUTPUT.json",
  callback = function()
    vim.bo.modifiable = true
    vim.bo.readonly = false
    --
    -- run jq formatter
      -- Extract JSON (starts at first { or [) then format with jq
    vim.cmd([[%!sed -n '/^{/,$p' | jq .]])
  end,
})
