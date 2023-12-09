return {
  {
    cmd = "Telescope",
    keys = {
      { "<leader>p", ":Telescope find_files<CR>", desc = "find files" },
      { "<leader>P", ":Telescope live_grep<CR>", desc = "grep files" },
      { "<leader>rs", ":Telescope resume<CR>", desc = "resume" },
      { "<leader>q", ":Telescope oldfiles<CR>", desc = "oldfiles" },
    },
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
