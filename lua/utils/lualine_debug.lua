-- Поместите в ваш конфиг (например, в after/plugin/debug.lua)
local function create_debug_commands()
  -- Функция для красивого вывода конфигурации
  local function inspect_lualine_config()
    -- Создаём новый буфер
    local buf = vim.api.nvim_create_buf(false, true)
    -- Создаём окно с буфером
    vim.api.nvim_open_win(buf, true, {
      relative = "editor",
      width = math.floor(vim.o.columns * 0.8),
      height = math.floor(vim.o.lines * 0.8),
      row = math.floor(vim.o.lines * 0.1),
      col = math.floor(vim.o.columns * 0.1),
      style = "minimal",
      border = "rounded",
    })

    -- Получаем конфигурацию
    local config = require("lualine").get_config()
    -- Преобразуем в строку с отступами
    local config_str = vim.inspect(config, {
      indent = "  ",
      newline = "\n",
      process = function(item, path)
        if type(item) == "function" then
          return "function() ... end"
        end
        return item
      end,
    })

    -- Записываем в буфер
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(config_str, "\n"))

    -- Устанавливаем опции буфера
    vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
    vim.api.nvim_set_option_value("filetype", "lua", { buf = buf })

    -- Добавляем маппинг для закрытия окна
    vim.keymap.set("n", "q", ":q<CR>", { buffer = buf, noremap = true, silent = true })
  end

  -- Создаём команду
  vim.api.nvim_create_user_command("LualineConfig", inspect_lualine_config, {})

  -- Создаём дополнительную команду для сохранения конфигурации в файл
  vim.api.nvim_create_user_command("LualineConfigSave", function(opts)
    local config = require("lualine").get_config()
    local config_str = vim.inspect(config)
    local file = io.open("lualine_config_dump.lua", "w")
    if file then
      file:write("-- Lualine configuration dump\n")
      file:write("-- Generated: " .. os.date() .. "\n\n")
      file:write("return " .. config_str)
      file:close()
      print("Configuration saved to lualine_config_dump.lua")
    else
      print("Error: Could not save configuration")
    end
  end, {})
end

-- Инициализируем команды
create_debug_commands()
