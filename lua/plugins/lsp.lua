return {
  {
    "folke/neodev.nvim",
    opts = {},
  },
  {
    event = "VeryLazy",
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
  },
  {
    event = "VeryLazy",
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
  },
}
