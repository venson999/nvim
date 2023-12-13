return {
  "rmagatti/auto-session",
  dependencies = {
    "venson999/auto-session-nvim-tree",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local auto_session = require("auto-session")
    local auto_session_nvim_tree = require("auto-session-nvim-tree")
    auto_session.setup({
      log_level = "error",
      auto_session_enabled = true,
      cwd_change_handling = {
        restore_upcoming_session = true, -- This is necessary for auto-session-nvim-tree
      },
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
      session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
    })
    auto_session_nvim_tree.setup(auto_session)

    local keymap = vim.keymap
    keymap.set("n", "<leader>ss", require("auto-session.session-lens").search_session, { noremap = true })
  end,
}
