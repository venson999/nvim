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
        custom_filter = function(buf)
          if vim.bo[buf].filetype == "help" then
            return false
          elseif vim.bo[buf].filetype == "fugitive" then
            return false
          elseif vim.bo[buf].filetype == "gitcommit" then
            return false
          elseif vim.fn.bufname(buf):match("Command") then
            return false
          else
            return true
          end
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
        separator_style = "slant",
      },
    })
  end,
}
