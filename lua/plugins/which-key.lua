return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    prefix = "<leader>",
  },
  config = function(_, opts)
    local mapping = {
      b = {
        name = "buffer",
      },
      e = {
        name = "explorer",
      },
      f = {
        name = "find",
      },
      h = {
        name = "harpoon",
      },
      s = {
        name = "session",
      },
      w = {
        name = "window",
      },
    }
    require("which-key").register(mapping, opts)
  end,
}
