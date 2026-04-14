return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",

      -- Python adapter
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            -- Use pytest
            runner = "pytest",

            -- Optional: specify python path
            python = function()
              return vim.fn.getcwd() .. "/.venv/bin/python"
            end,

            -- pytest args (optional)
            args = { "-vv" },

            -- Enable pytest discovery via treesitter
            dap = { justMyCode = false },
          }),
        },
      })
    end,
  },
}
