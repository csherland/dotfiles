-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Toggle comments
vim.keymap.set("n", "<C-Space>", "gcc", { remap = true, desc = "Toggle comment (gcc)" })
vim.keymap.set("v", "<C-Space>", "gc", { remap = true, desc = "Toggle comment (visual)" })

-- Buffer navigation
vim.keymap.set("n", "<C-m>", ":bnext<CR>", { remap = true, desc = "Move to next buffer" })
vim.keymap.set("n", "<C-b>", ":bprev<CR>", { remap = true, desc = "Move to prev buffer" })
vim.keymap.set("n", "<C-x>", ":bp<CR>:bd #<CR>", { remap = true, desc = "Close buffer without saving" })

-- copilot
vim.keymap.set("n", "<leader>cpd", ":Copilot disable<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>cpe", ":Copilot enable<cr>", { silent = true, noremap = true })
