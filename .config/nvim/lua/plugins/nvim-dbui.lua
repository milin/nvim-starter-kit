return {
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' } },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location = "~/development/dbui/"

      vim.g.dbs = {
        {
          name = 'test',
          url = 'postgres://127.0.0.1:5430/saintjohnenergy-test.krakencore?sslmode=disable'
        },
        {
          name = 'local',
          url = 'postgres://127.0.0.1:5432/saintjohnenergy-consumer?sslmode=disable'
        },
      }
    end,
  },
}
