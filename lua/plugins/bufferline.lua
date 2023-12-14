return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
  config = function()
    vim.opt.termguicolors = true
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        mode = "buffers",
        close_command = "Bdelete %d",
        offsets = {
          {
            filetype = "NvimTree",
            text_align = "center",
          },
        },
        separator_style = "slant",
      },
    })

    local keymap = vim.keymap
    keymap.set(
      "n",
      "<S-h>",
      "<cmd>BufferLineMovePrev<cr>",
      { desc = "Go to previous buffer", noremap = true, silent = true }
    )
    keymap.set(
      "n",
      "<S-l>",
      "<cmd>BufferLineMoveNext<cr>",
      { desc = "Go to next buffer", noremap = true, silent = true }
    )
    keymap.set("n", "<leader>bx", "<cmd>Bdelete<cr>", { desc = "Close other buffers", noremap = true, silent = true })
    keymap.set(
      "n",
      "<leader>bo",
      "<cmd>BufferLineCloseOthers<cr>",
      { desc = "Close other buffers", noremap = true, silent = true }
    )
    keymap.set(
      "n",
      "<leader>ba",
      "<cmd>:bufdo :Bdelete<cr>",
      { desc = "Close all buffers", noremap = true, silent = true }
    )
  end,
}
