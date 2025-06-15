return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded",
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "jsonls",
        "vtsls",
        "vue_ls",
        "html",
        "cssls",
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "eslint_d",
      },
    })
  end,
}
