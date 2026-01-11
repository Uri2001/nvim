-- Disable makrsman, use markdown-oxide
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      marksman = { enabled = false },
    },
  },
}
