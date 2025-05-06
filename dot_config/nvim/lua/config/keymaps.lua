-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-Space>", "gcc", { remap = true, desc = "Toggle comment (gcc)" })
vim.keymap.set("v", "<C-Space>", "gc", { remap = true, desc = "Toggle comment (visual)" })
