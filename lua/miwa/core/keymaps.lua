vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i","jk", "<ESC>", {desc = "Exit insert mode with jk"})
keymap.set("n", "<leader>nh", ":nohl<CR>", {desc = "Clear search highlights"})

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", {desc = "Open new tab"})
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", {desc = "Close current tab"})
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", {desc = "Go to next tab"})
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", {desc = "Go to previous tab"})
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", {desc = "Open curent buffer in new tab"})
