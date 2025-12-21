return {
  "SmiteshP/nvim-navic",
  dependencies = { "neovim/nvim-lspconfig" },
  lazy = true,
  event = "LspAttach",
  opts = {
    update_delay = 100,
    highlight = true,
  },
}
