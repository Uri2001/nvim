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

-- Add context menu

local function spell_menu_item()
  if not vim.wo.spell then
    return nil
  end
  local word = vim.fn.expand("<cword>")
  if word == "" then
    return nil
  end

  local bad = vim.fn.spellbadword(word)
  if bad[1] == "" then
    return nil
  end

  local suggestions = vim.fn.spellsuggest(word, 10)
  local items = {}
  for i, s in ipairs(suggestions) do
    table.insert(items, {
      name = s,
      cmd = function()
        vim.cmd("normal! " .. i .. "z=")
      end,
    })
  end
  table.insert(items, { name = "separator" })
  table.insert(items, {
    name = "Add to dictionary",
    cmd = function()
      vim.cmd("normal! zg")
    end,
  })
  table.insert(items, {
    name = "Ignore word",
    cmd = function()
      vim.cmd("normal! zG")
    end,
  })

  return { name = " Spelling: " .. word, items = items }
end

vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
  require("menu.utils").delete_old_menus()
  vim.cmd.exec('"normal! \\<RightMouse>"')

  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local base = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

  local ok, items = pcall(function()
    return vim.deepcopy(require("menus." .. base))
  end)
  if ok then
    local spell_item = spell_menu_item()
    if spell_item then
      table.insert(items, 1, spell_item)
      table.insert(items, 2, { name = "separator" })
    end
    require("menu").open(items, { mouse = true })
  else
    require("menu").open(base, { mouse = true })
  end
end, {})
