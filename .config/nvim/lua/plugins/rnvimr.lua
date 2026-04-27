return {
  "kevinhwang91/rnvimr",
  cmd = "RnvimrToggle",
  config = function()
    vim.g.rnvimr_ex_enable = 1 -- Make Ranger replace netrw
    vim.g.rnvimr_enable_picker = 1
    -- More configuration options can be added here
  end,
  mappings = {
    { "<leader>fe", ":RnvimrToggle<CR>", desc = "Toggle Ranger" },
  },
}
