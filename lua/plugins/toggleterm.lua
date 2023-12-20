return {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "TermExec" },
  keys = {
    { "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
  },
  opts = {
    direction = "horizontal",
    shell = "pwsh",
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    function _G.set_terminal_keymaps()
      local options = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], options)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], options)
      vim.keymap.set("t", "<C-h>", [[<cmd>wincmd h<cr>]], options)
      vim.keymap.set("t", "<C-j>", [[<cmd>wincmd j<cr>]], options)
      vim.keymap.set("t", "<C-k>", [[<cmd>wincmd k<cr>]], options)
      vim.keymap.set("t", "<C-l>", [[<cmd>wincmd l<cr>]], options)
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], options)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
}
