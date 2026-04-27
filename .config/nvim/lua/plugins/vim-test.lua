return {
  "vim-test/vim-test",
  cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
  keys = {
    { "<leader>rt", "<cmd>TestNearest<cr>", desc = "Run nearest test" },
    { "<leader>rtf", "<cmd>TestFile<cr>", desc = "Run test file" },
    { "<leader>rta", "<cmd>TestSuite<cr>", desc = "Run test suite" },
    { "<leader>rtl", "<cmd>TestLast<cr>", desc = "Run last test" },
    { "<leader>rtd", "<cmd>call ToggleTestDebug()<cr>", desc = "Toggle test debug mode" },
  },
  config = function()
    vim.g["test#python#runner"] = "pytest"
    vim.g["test#python#pytest#options"] = "-s --dc=SaintJohnEnergyInterfaceAgnostic --snapshot-update"
    vim.g["test#strategy"] = "toggleterm"
    vim.cmd([[
      let g:test_debug_mode = 0

      function! KrakenTransform(cmd)
        let l:root = '/Users/milind.shakya/development/kraken-core/src'
        let l:args = substitute(a:cmd, '^.*pytest\s\+', '', '')
        let l:args = substitute(l:args, ' src/', ' ', '')
        if g:test_debug_mode
          return 'cd ' . l:root . ' && python -m debugpy --listen 54546 --wait-for-client -m pytest ' . l:args
        else
          return 'cd ' . l:root . ' && python -m pytest ' . l:args
        endif
      endfunction

      function! ToggleTestDebug()
        let g:test_debug_mode = !g:test_debug_mode
        echo g:test_debug_mode ? "Test debug ON (port 54546)" : "Test debug OFF"
      endfunction

      let g:test#custom_transformations = {'kraken': function('KrakenTransform')}
      let g:test#transformation = 'kraken'
    ]])
  end,
}
