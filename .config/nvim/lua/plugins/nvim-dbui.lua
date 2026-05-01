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
      -- If this is set to 1, opening any of the table helpers will also automatically execute the query.
      vim.g.db_ui_auto_execute_table_helpers = 1

      vim.g.dbs = {
        {
          name = 'prod-sje',
          url = 'postgres://127.0.0.1:5430/saintjohnenergy-prod.krakencore?sslmode=disable'
        },
        {
          name = 'test-sje',
          url = 'postgres://127.0.0.1:5430/saintjohnenergy-test.krakencore?sslmode=disable'
        },
        {
          name = 'local-sje',
          url = 'postgres://127.0.0.1:5432/saintjohnenergy-consumer?sslmode=disable'
        },
      }
    end,
  },
}
