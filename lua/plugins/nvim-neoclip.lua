return {
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "kkharji/sqlite.lua", -- добавляем sqlite зависимость
    },
    config = function()
      require("neoclip").setup({
        history = 1000,
        enable_persistent_history = true,
        preview = true,
        default_register = '"',
        -- убираем db_path, пусть сам создаст
      })
    end,
    keys = {
      {
        "<leader>fy",
        function()
          require("telescope").load_extension("neoclip")
          vim.cmd("Telescope neoclip")
        end,
        desc = "Yank History",
      },
    },
  },
}
