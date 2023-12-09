return {
  {
    "stevearc/conform.nvim",
    opts = {},
    event = "VeryLazy",
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          --python = { "isort", "black" },
          -- Use a sub-list to run only the first available formatter
          --javascript = { { "prettierd", "prettier" } },
        },
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_fallback = true,
          async = false,
        },
        formatters = {
          stylua = {
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
          },
        },
      })
      vim.keymap.set({ "n", "v" }, "<leader>f", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end,
  },
}
