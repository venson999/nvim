return {
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    cmd = "Git",
    config = function()
      vim.cmd.cnoreabbrev([[git Git]])
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    config = function()
      require("gitsigns").setup()
    end,
  },
}
