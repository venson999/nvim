return {
  "folke/which-key.nvim",
  dependencies = {
    "echasnovski/mini.icons",
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    prefix = "<leader>",
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>H", group = "harpoon" },
        { "<leader>b", group = "buffer" },
        { "<leader>e", group = "explorer" },
        { "<leader>f", group = "find" },
        { "<leader>h", group = "git hunk" },
        { "<leader>s", group = "session" },
        { "<leader>w", group = "window" },
      },
    },
  },
}
