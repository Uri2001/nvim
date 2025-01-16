-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Exit insert mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- F5 toggle spell check
vim.api.nvim_set_keymap('n', '<F5>', ':set spell!<CR>:lua print("Spell check: " .. (vim.wo.spell and "ON" or "OFF"))<CR>', { noremap = true, silent = true })