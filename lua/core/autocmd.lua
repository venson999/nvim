local function augroup(name)
  return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- show neo-tree on sessionload
vim.api.nvim_create_autocmd("SessionLoadPost", {
  group = augroup("toggle_neo-tree"),
  callback = function()
    require("neo-tree.command").execute({ action = "show" })
  end,
})
