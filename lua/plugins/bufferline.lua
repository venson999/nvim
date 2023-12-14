return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.opt.termguicolors = true
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        mode = "buffers",
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
    keymap.set("n", "<S-h>", ":BufferLineCyclePrev<cr>", { desc = "Go to previous tab", noremap = true, silent = true })
    keymap.set("n", "<S-l>", ":BufferLineCycleNext<cr>", { desc = "Go to next tab", noremap = true, silent = true })
  end,
}
