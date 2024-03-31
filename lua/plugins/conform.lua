return {
  {
    "stevearc/conform.nvim",
    event = "LazyFile",
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          --python = { "isort", "black" },
          -- Use a sub-list to run only the first available formatter
          javascript = { "prettier" },
          json = { "prettier" },
          jsonc = { "prettier" },
        },
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_fallback = true,
          async = false,
        },
        formatters = {
          prettier = {
            prepend_args = { "--no-semi" },
          },
        },
      })
    end,
  },
}
