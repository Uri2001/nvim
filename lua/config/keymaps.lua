-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Exit insert mode
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- F5 toggle spell check (buffer-local)
vim.keymap.set("n", "<F5>", function()
  vim.wo.spell = not vim.wo.spell
  local status = vim.wo.spell and "ON" or "OFF"
  print("Spell check: " .. status)
end, { noremap = true, silent = true })
