-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to window on left" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to window on right" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window on below" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window on above" })
keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>s", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>x", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

-- tab management
-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
