-- lua/plugins/alpha.lua

return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local dashboard = require("alpha.themes.dashboard")
    opts = opts or dashboard.config or {}
    opts.section = opts.section or dashboard.section or {}
    opts.section.header = opts.section.header or dashboard.section.header

    -- Настраиваем свой логотип
    opts.section.header.val = {
      [[                                                     ]],
      [[ ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓  ]],
      [[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
      [[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
      [[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
      [[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
      [[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
      [[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
      [[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
      [[          ░    ░  ░    ░ ░        ░   ░         ░    ]],
      [[                                 ░                   ]],
    }

    -- Дополнительно можно настроить цвета
    --- dashboard.section.header.opts.hl = "AlphaHeader"

    -- Можно изменить кнопки меню
    --     dashboard.section.buttons.val = {
    --     dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    --     dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
    --     dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
    --     dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    --     dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
    --     dashboard.button("l", "  Lazy", ":Lazy<CR>"),
    --     dashboard.button("q", "  Quit", ":qa<CR>"),
    -- }

    -- Настройка футера
    -- local function footer()
    --     local stats = require("lazy").stats()
    --     local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    --     return "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
    -- end

    -- dashboard.section.footer.val = footer()
    -- dashboard.section.footer.opts.hl = "AlphaFooter"

    -- Настройка расположения
    -- dashboard.config.layout = {
    --     { type = "padding", val = 2 },
    --     dashboard.section.header,
    --     { type = "padding", val = 2 },
    --     dashboard.section.buttons,
    --     { type = "padding", val = 1 },
    --     dashboard.section.footer,
    -- }

    if not opts.layout and dashboard.config and dashboard.config.layout then
      opts.layout = dashboard.config.layout
    end

    return opts
  end,
}
