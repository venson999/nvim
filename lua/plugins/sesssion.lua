return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
    config = function()
      local args = vim.api.nvim_get_vvar("argv")
      if #args > 2 then
      else
        require("persistence").load({ last = true })
      end
    end,
  },
}
