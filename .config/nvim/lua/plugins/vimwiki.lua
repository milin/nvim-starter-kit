return {
  -- https://github.com/vimwiki/vimwiki
  'vimwiki/vimwiki',
  -- Only load this plugin if tmux is being used
  event = function()
    if vim.fn.exists("$TMUX") == 1 then
      return "VeryLazy"
    end
  end,
}

