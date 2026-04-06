return {
  "vimwiki/vimwiki",

  -- ❗ Vimwiki should NOT be lazy-loaded
  lazy = false,

  init = function()
    local pro_wiki = {
      path = "/Users/milind.shakya/Library/CloudStorage/Box-Box/VimWiki/professional_development.wiki/",
      syntax = "markdown",
      ext = ".md",
    }

    local per_wiki = {
      path = "/Users/milind.shakya/Library/CloudStorage/Box-Box/VimWiki/personal_development.wiki/",
      syntax = "markdown",
      ext = ".md",
    }

    local shared_wiki = {
      path = "/Users/milind.shakya/Library/CloudStorage/Box-Box/VimWiki/shared.wiki/",
      syntax = "markdown",
      ext = ".md",
    }

    -- ✅ MUST be in init (before plugin loads)
    vim.g.vimwiki_list = { pro_wiki, per_wiki, shared_wiki }
    vim.g.vimwiki_listsyms = "✗◐●✓"
    vim.g.vimwiki_folding = "expr"
    vim.g.vimwiki_table_mappings = 0
  end,

  config = function()
    -- your commands / keymaps go here if needed
  end,
}
