require("core")
require("lua.lazy")

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  pattern = { "*" },
  callback = function()
    vim.highlight.on_yank({
      timeout = 300,
    })
  end,
})

local args = vim.api.nvim_get_vvar("argv")
if #args > 2 then
else
  require("persistence").load({ last = true })
end
