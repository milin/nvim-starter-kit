return {
  "vim-test/vim-test",
  cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
  keys = {
    { "<leader>rt", "<cmd>TestNearest<cr>", desc = "Run nearest test" },
    { "<leader>rtf", "<cmd>TestFile<cr>", desc = "Run test file" },
    { "<leader>rta", "<cmd>TestSuite<cr>", desc = "Run test suite" },
    { "<leader>rtl", "<cmd>TestLast<cr>", desc = "Run last test" },
  },
  config = function()
    vim.g["test#python#runner"] = "pytest"
    vim.g["test#strategy"] = "toggleterm"
    vim.cmd([[
      function! KrakenTransform(cmd)
        return 'inv localdev.pytest -s ' . shellescape(a:cmd[6:])
      endfunction
      let g:test#custom_transformations = {'kraken': function('KrakenTransform')}
      let g:test#transformation = 'kraken'
    ]])
  end,
}
