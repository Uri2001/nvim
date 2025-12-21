-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("utils.lualine_debug")
require("blink.cmp").setup({
  keymap = {
    preset = "super-tab",
  },
})
