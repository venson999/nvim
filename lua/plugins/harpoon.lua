return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  -- stylua: ignore
  keys = {
    { "<leader>Hl", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "toggle the list" },
    { "<leader>Ha", function() require("harpoon"):list():append() end,  desc = "add to the list" },
    { "<leader>H1", function() require("harpoon"):list():select(1) end, desc = "switch to the 1th file" },
    { "<leader>H2", function() require("harpoon"):list():select(2) end, desc = "switch to the 2th file" },
    { "<leader>H3", function() require("harpoon"):list():select(3) end, desc = "switch to the 3th file" },
    { "<leader>H4", function() require("harpoon"):list():select(4) end, desc = "switch to the 4th file" },
    { "<leader>H5", function() require("harpoon"):list():select(5) end, desc = "switch to the 5th file" },
  },
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
}
