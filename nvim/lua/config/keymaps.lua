-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Window navigation with Ctrl+h/j/k/l (works in all modes including terminal)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate to up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate to right window" })

-- Terminal mode navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Navigate to left window (terminal)" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Navigate to down window (terminal)" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Navigate to up window (terminal)" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Navigate to right window (terminal)" })

-- Escape terminal mode with Ctrl+; (alternative to Ctrl+\ Ctrl+n)
vim.keymap.set("t", "<C-;>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
