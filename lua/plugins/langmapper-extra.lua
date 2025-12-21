return {
  "Wansmer/langmapper.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("langmapper").setup({
      default_layout = [[ABCDEFGHIJKLMNOPQRSTUVWXYZ<>:"{}~abcdefghijklmnopqrstuvwxyz,.;'[]\]],
      layouts = {
        ru = {
          layout = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯБЮЖЭХЪËфисвуапршолдьтщзйкыегмцчнябюжэхъё",
        },
      },
    })
    require("langmapper").hack_get_keymap()
    require("langmapper").automapping({ global = true, buffer = true })
  end,
}
