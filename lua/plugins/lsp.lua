return {
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup({})
    end,
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
