return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
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
      t = {
        name = "tab",
      },
      w = {
        name = "window",
      },
    }
    require("which-key").register(mapping, opts)
  end,
}
