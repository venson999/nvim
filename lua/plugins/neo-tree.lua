return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      use_libuv_file_watcher = true,
    },
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
    },
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.opt.relativenumber = true
          vim.opt.number = true
        end,
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)

    local keymap = vim.keymap
    local command = require("neo-tree.command")

    -- stylua: ignore start
    keymap.set("n", "<leader>ef", function() command.execute({ source = "filesystem", toggle = true }) end, { desc = "File explorer" })
    keymap.set("n", "<leader>eb", function() command.execute({ source = "buffers", toggle = true }) end, { desc = "Buffer explorer" })
    keymap.set("n", "<leader>eg", function() command.execute({ source = "git_status", toggle = true }) end, { desc = "Git explorer" })
    -- stylua: ignore end

    -- show neo-tree on sessionload
    vim.api.nvim_create_autocmd("SessionLoadPost", {
      group = vim.api.nvim_create_augroup("user_toggle_neo-tree", { clear = true }),
      callback = function()
        require("neo-tree.command").execute({ action = "show" })
      end,
    })
  end,
}
