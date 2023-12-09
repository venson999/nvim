return {
  {
    "preservim/nerdtree",
    event = "VeryLazy",
    --cmd = "NERDTree",
    keys = {
      { "<leader>t", ":NERDTreeToggle<CR>", desc = "toggle nerdtree" },
    },
    config = function()
      vim.cmd([[
	" enable line numbers
	let NERDTreeShowLineNumbers=1
	" make sure relative line numbers are used
	autocmd FileType nerdtree setlocal relativenumber
      ]])
    end,
    dependencies = {
      "Xuyuanp/nerdtree-git-plugin",
      "ryanoasis/vim-devicons",
    },
  },
}
