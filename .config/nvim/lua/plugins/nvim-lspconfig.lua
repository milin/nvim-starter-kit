-- LSP Support
return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    "folke/neodev.nvim",
    "hrsh7th/cmp-nvim-lsp", -- make sure this exists
  },

  config = function()
    ---------------------------------------------------------------------------
    -- Setup
    ---------------------------------------------------------------------------
    require("mason").setup()
    require("neodev").setup()

    ---------------------------------------------------------------------------
    -- LSP install list
    ---------------------------------------------------------------------------
    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "cssls",
        "html",
        "gradle_ls",
        "groovyls",
        "lua_ls",
        "jdtls",
        "jsonls",
        "lemminx",
        "marksman",
        "quick_lint_js",
        "ruff",       -- ✅ instead of ruff_lsp
        "yamlls",
        "ts_ls",      -- ✅ instead of tsserver
      },
    })

    ---------------------------------------------------------------------------
    -- Tool installer (non-LSP tools)
    ---------------------------------------------------------------------------
    require("mason-tool-installer").setup({
      ensure_installed = {
        "java-debug-adapter",
        "java-test",
      },
      run_on_start = true, -- ✅ FIXED (belongs here)
    })

    ---------------------------------------------------------------------------
    -- LSP setup
    ---------------------------------------------------------------------------
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local function on_attach(client, bufnr)
      -- keymaps here if you want
    end

    ---------------------------------------------------------------------------
    -- Auto setup installed servers
    ---------------------------------------------------------------------------
    for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
      if server ~= "jdtls" and server ~= "lua_ls" then
        lspconfig[server].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end
    end

    ---------------------------------------------------------------------------
    -- Custom overrides
    ---------------------------------------------------------------------------

    -- Lua
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    ---------------------------------------------------------------------------
    -- UI tweaks
    ---------------------------------------------------------------------------
    local floating = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded"
      return floating(contents, syntax, opts, ...)
    end
  end,
}
