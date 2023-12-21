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
        a = { "<cmd>:bufdo :Bdelete<cr>", "Close all buffers" },
        o = { "<cmd>BufferLineCloseOthers<cr>", "Close other buffers" },
        x = { "<cmd>Bdelete<cr>", "Close current buffers" },
      },
      e = {
        name = "explorer",
        e = { "<cmd>NvimTreeToggle<CR>", "Toggle file explorer" },
        f = { "<cmd>NvimTreeFindFile<CR>", "Toggle file explorer on current file" },
        c = { "<cmd>NvimTreeCollapse<CR>", "Collapse file explorer" },
        r = { "<cmd>NvimTreeRefresh<CR>", "Refresh file explorer" },
      },
      f = {
        name = "find",
        c = { "<cmd>Telescope grep_string<cr>", "Find string under cursor in cwd" },
        b = { "<cmd>Telescope file_browser<cr>", "Open file browser in cwd" },
        f = { "<cmd>Telescope find_files<cr>", "Fuzzy find files in cwd" },
        r = { "<cmd>Telescope oldfiles<cr>", "Fuzzy find recent files" },
        s = { "<cmd>Telescope live_grep<cr>", "Find string in cwd" },
      },
      -- stylua: ignore start
      h = {
        name = "harpoon",
        a = { function() require("harpoon"):list():append() end, "Add to the list" },
        h = { function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, "Toggle the list" },
        ["1"] = { function() require("harpoon"):list():select(1) end, "Switch to the 1th file" },
        ["2"] = { function() require("harpoon"):list():select(2) end, "Switch to the 2th file" },
        ["3"] = { function() require("harpoon"):list():select(3) end, "Switch to the 3th file" },
        ["4"] = { function() require("harpoon"):list():select(4) end, "Switch to the 4th file" },
        ["5"] = { function() require("harpoon"):list():select(5) end, "Switch to the 5th file" },
      },
      -- stylua: ignore end
      s = {
        name = "session",
        a = { "<cmd>SessionManager save_current_session<cr>", "Save current session" },
        d = { "<cmd>SessionManager delete_session<cr>", "Select and delete session" },
        l = { "<cmd>SessionManager load_last_session<cr>", "Load last session" },
        s = { "<cmd>SessionManager load_session<cr>", "Select and load session" },
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
