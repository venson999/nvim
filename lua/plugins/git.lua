return {
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    cmd = "Git",
    config = function()
      vim.cmd.cnoreabbrev([[git Git]])
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "tpope/vim-rhubarb",
    event = "VeryLazy",
  },
  {
    "rhysd/conflict-marker.vim",
    event = "VeryLazy",
    config = function()
      vim.cmd([[
    	  " disable the default highlight group
	      let g:conflict_marker_highlight_group = ''

      	" Include text after begin and end markers
	      let g:conflict_marker_begin = '^<<<<<<< .*$'
	      let g:conflict_marker_end   = '^>>>>>>> .*$'

	      highlight ConflictMarkerBegin guibg=#2f7366
	      highlight ConflictMarkerOurs guibg=#2e5049
	      highlight ConflictMarkerTheirs guibg=#344f69
	      highlight ConflictMarkerEnd guibg=#2f628e
	      highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81
      ]])
    end,
  },
}
