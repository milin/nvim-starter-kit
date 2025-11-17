-- LSP Support
return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',

  dependencies = {
    -- LSP Manager
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Auto-install LSPs, linters, formatters, debuggers
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- LSP progress UI
    { 'j-hui/fidget.nvim', opts = {} },

    -- Neovim Lua development (for Lua LSP)
    'folke/neodev.nvim',
  },

  config = function()
    ---------------------------------------------------------------------------
    -- Mason Setup
    ---------------------------------------------------------------------------
    require('mason').setup()

    require('mason-lspconfig').setup({
      ensure_installed = {
        'bashls',
        'cssls',
        'html',
        'gradle_ls',
        'groovyls',
        'lua_ls',
        'jdtls',
        'jsonls',
        'lemminx',
        'marksman',
        'quick_lint_js',
        'pylsp',
        'yamlls',
        'ts_ls',
      },
    })

    ---------------------------------------------------------------------------
    -- Mason Tool Installer Setup
    ---------------------------------------------------------------------------
    require('mason-tool-installer').setup({
      ensure_installed = {
        'java-debug-adapter',
        'java-test',
      },
    })

    -- Run MasonToolsInstall manually (because plugin loads VeryLazy)
    vim.api.nvim_command('MasonToolsInstall')

    ---------------------------------------------------------------------------
    -- LSP Defaults
    ---------------------------------------------------------------------------
    local lspconfig = require('lspconfig')
    local mason_lspconfig = require('mason-lspconfig')

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local function on_attach(client, bufnr)
      -- Add your keybindings here…
    end

    ---------------------------------------------------------------------------
    -- mason-lspconfig Handlers (NEW API, Neovim 0.11+)
    ---------------------------------------------------------------------------
    mason_lspconfig.setup_handlers({

      -- Default handler for *all* servers
      function(server_name)
        if server_name ~= 'jdtls' then
          lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end
      end,

      -------------------------------------------------------------------------
      -- Override specific LSPs below
      -------------------------------------------------------------------------

      -- LuaLS custom settings
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' },
              },
            },
          },
        })
      end,
    })

    ---------------------------------------------------------------------------
    -- Global LSP UI settings
    ---------------------------------------------------------------------------
    local floating = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded"
      return floating(contents, syntax, opts, ...)
    end

  end,
}

