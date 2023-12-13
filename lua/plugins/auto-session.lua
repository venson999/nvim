return {
  "rmagatti/auto-session",
  dependencies = { "venson999/auto-session-nvim-tree" },
  config = function()
    local auto_session = require("auto-session")
    local auto_session_nvim_tree = require("auto-session-nvim-tree")

    auto_session.setup({
      log_level = "error",
      cwd_change_handling = {
        restore_upcoming_session = true,
      },
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    })
    auto_session_nvim_tree.setup(auto_session)

    local keymap = vim.keymap

    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
  end,
}
