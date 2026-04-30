return {
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location= "~/development/dbui/"
      vim.g.dbs = {
        {
        name = 'test',
        url = 'postgres://localhost:5430/saintjohnenergy-test.krakencore'
      },
        {
        name = 'local',
        url = 'postgres://localhost:5432/saintjohnenergy-consumer'
      },
    }
    end,
  },
}
