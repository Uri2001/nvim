-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Enable spell check in Russian and English
vim.opt.spelllang = "en,ru"
vim.opt.spellfile = vim.fn.stdpath('config') .. '/spell/en.utf-8.add,' .. vim.fn.stdpath('config') .. '/spell/ru.utf-8.add'
