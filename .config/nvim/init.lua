-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- This has to be set before initializing lazy
vim.g.mapleader = " "
-- Initialize lazy with dynamic loading of anything in the plugins directory
require("lazy").setup("plugins", {
   change_detection = {
    enabled = true, -- automatically check for config file changes and reload the ui
    notify = false, -- turn off notifications whenever plugin changes are made
  },
})
vim.opt.shellcmdflag = '-ci'
vim.g.mason_python = "/Users/milindshakya/.pyenv/shims/python"


local function applyFoldsAndThenCloseAllFolds(bufnr, providerName)
    require('async')(function()
        bufnr = bufnr or vim.api.nvim_get_current_buf()
        -- make sure buffer is attached
        require('ufo').attach(bufnr)
        -- getFolds return Promise if providerName == 'lsp'
        local ok, ranges = pcall(await, require('ufo').getFolds(bufnr, providerName))
        if ok and ranges then
            ok = require('ufo').applyFolds(bufnr, ranges)
        end
    end)
end


vim.api.nvim_create_autocmd('BufRead', {
        pattern = '*',
        callback = function(e)
            applyFoldsAndThenCloseAllFolds(e.buf, 'treesitter')
        end
    })



-- These modules are not loaded by lazy
require("core.options")
require("core.keymaps")
require("core.python_dap")
