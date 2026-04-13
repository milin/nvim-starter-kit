return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  opts = {
    highlight = { enable = true },
    indent = { enable = false },
    auto_install = true,
    ensure_installed = {
      'lua',
      'comment',
      'markdown',
      'markdown_inline',
    },
  },
}
