return {
  -- disable mini.starter (используем alpha)
  { "nvim-mini/mini.starter", enabled = false },
  { "hrsh7th/nvim-cmp", enabled = false },

  -- добавляем полезные плагины
  { "RRethy/vim-illuminate", event = "VeryLazy" },

  -- Work around systemd_ls recursion during auto-enable
  {
    "mason-org/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.handlers = opts.handlers or {}
      opts.handlers["systemd_ls"] = function() end
    end,
  },
}
