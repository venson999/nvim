return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    menu = {
      width = 120,
    },
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
    },
  },
  config = function(_, opts)
    local harpoon = require("harpoon")
    harpoon.setup(opts)
    local keymap = vim.keymap
    keymap.set("n", "<leader>ha", function()
      harpoon:list():append()
    end, { desc = "Add to the list" })
    keymap.set("n", "<leader>hh", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Toggle the list" })
    vim.keymap.set("n", "<leader>h1", function()
      harpoon:list():select(1)
    end, { desc = "Switch to the 1th file" })
    vim.keymap.set("n", "<leader>h2", function()
      harpoon:list():select(2)
    end, { desc = "Switch to the 2th file" })
    vim.keymap.set("n", "<leader>h3", function()
      harpoon:list():select(3)
    end, { desc = "Switch to the 3th file" })
    vim.keymap.set("n", "<leader>h4", function()
      harpoon:list():select(4)
    end, { desc = "Switch to the 4th file" })
    vim.keymap.set("n", "<leader>h5", function()
      harpoon:list():select(5)
    end, { desc = "Switch to the 5th file" })
  end,
}
