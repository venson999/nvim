return {
  {
    "stevearc/conform.nvim",
    event = "LazyFile",
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          vue = { "prettier" },
          json = { "prettier" },
          jsonc = { "prettier" },
          python = { "isort" },
        },
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_fallback = true,
          async = false,
        },
      })
    end,
  },
}
