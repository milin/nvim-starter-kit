return {
  -- https://github.com/vimwiki/vimwiki
  'vimwiki/vimwiki',
  -- Only load this plugin if tmux is being used
  event = function()
    if vim.fn.exists("$TMUX") == 1 then
      return "VeryLazy"
    end
    return nil
  end,
  config = function()
    -- Define wiki configurations
    local pro_wiki = {
      path = '~/Box Sync/VimWiki/professional_development.wiki',
      syntax = 'markdown',
      ext = '.md'
    }

    local per_wiki = {
      path = '~/Box Sync/VimWiki/personal_development.wiki',
      syntax = 'markdown',
      ext = '.md'
    }

    local shared_wiki = {
      path = '~/Box Sync/VimWiki/shared.wiki',
      syntax = 'markdown',
      ext = '.md'
    }

    -- Set vimwiki global variables
    vim.g.vimwiki_listsyms = '✗○◐●✓'
    vim.g.vimwiki_list = { pro_wiki, per_wiki, shared_wiki }
    vim.g.vimwiki_folding = 'expr'
    vim.g.vimwiki_table_mappings = 0

    -- Set up search commands and keymaps
    vim.api.nvim_create_user_command('Ngrep', function(opts)
      local search_path = vim.fn.expand('~/Box Sync/VimWiki/**/*.md')
      vim.cmd('vimgrep /' .. vim.fn.escape(opts.args, '/\\') .. '/j ' .. vim.fn.fnameescape(search_path))
    end, { nargs = 1 })

    -- Set up keymaps for vimwiki search
    vim.keymap.set('n', '<leader>m', ':Ngrep ', { desc = 'Search VimWiki' })
    vim.keymap.set('n', '<leader>]', ':cnext<CR>', { silent = true, desc = 'Next search result' })
    vim.keymap.set('n', '<leader>[', ':cprevious<CR>', { silent = true, desc = 'Previous search result' })
  end,
}
