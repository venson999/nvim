return {
  "nvimdev/lspsaga.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {},
}
