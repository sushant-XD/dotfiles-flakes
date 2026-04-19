vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", {desc = "Exit insert mode with jk"})

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) --increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) --decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- window resizing with ctrl + arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>x", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<tab>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<shift><tab>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- file operations
keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>wa<CR>", { desc = "Save all files" })

-- insert mode navigation (hjkl movement)
keymap.set("i", "<A-h>", "<Left>", { desc = "Move left in insert mode" })
keymap.set("i", "<A-j>", "<Down>", { desc = "Move down in insert mode" })
keymap.set("i", "<A-k>", "<Up>", { desc = "Move up in insert mode" })
keymap.set("i", "<A-l>", "<Right>", { desc = "Move right in insert mode" })

-- insert mode word navigation
keymap.set("i", "<A-b>", "<C-Left>", { desc = "Move word backward in insert mode" })
keymap.set("i", "<A-w>", "<C-Right>", { desc = "Move word forward in insert mode" })

-- insert mode line navigation  
keymap.set("i", "<A-$>", "<End>", { desc = "Move to end of line in insert mode" })

-- file explorer
keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Tmux Navigation integration
keymap.set("n","<C-h>", "TmuxNavigateLeft<CR>",{desc = "window left"})
keymap.set("n","<C-l>", "TmuxNavigateRight<CR>",{desc = "window right"})
keymap.set("n","<C-j>", "TmuxNavigateDown<CR>",{desc = "window down"})
keymap.set("n","<C-k>", "TmuxNavigateUp<CR>",{desc = "window up"})
