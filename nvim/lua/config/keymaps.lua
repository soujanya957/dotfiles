-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

local keymap = vim.keymap

-- general keymap
keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>h") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- split window equally
keymap.set("n", "<leader>sx", ":close<CR>") -- close window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- <leader>yz : open yazi at current file
vim.keymap.set("n", "<leader>yz", function()
  require("yazi").yazi()
end, { desc = "Open yazi at current file" })

-- <leader>yw : open yazi in nvim's working directory
vim.keymap.set("n", "<leader>yw", function()
  require("yazi").yazi({ cwd = vim.fn.getcwd() })
end, { desc = "Open yazi in working directory" })

-- <leader>yr : resume last yazi session (toggle)
vim.keymap.set("n", "<leader>yr", function()
  require("yazi").yazi({ toggle = true })
end, { desc = "Resume last yazi session" })

-- <leader>yh : show yazi help (when yazi is open)
vim.keymap.set("n", "<leader>yh", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<F1>", true, false, true), "n", false)
end, { desc = "Show yazi help (when yazi is open)" })

-- =========================================================

-- Obsidian keymaps
-- Requires epwalsh/obsidian.nvim to be configured

-- Quick switch between notes
keymap.set("n", "<leader>oo", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Obsidian Quick Switch" })

-- Search notes
keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Obsidian Search" })

-- Create a new note
keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Obsidian New Note" })

-- Insert template into current note
keymap.set("n", "<leader>otm", "<cmd>ObsidianTemplate<CR>", { desc = "Obsidian Insert Template" })

-- New note from template
keymap.set("n", "<leader>ont", "<cmd>ObsidianNewFromTemplate<CR>", { desc = "Obsidian New From Template" })

-- Obsidian: always follow link in a vertical split
keymap.set("n", "<leader>of", "<cmd>ObsidianFollowLink vsplit<CR>", { desc = "Obsidian Follow Link (vsplit)" })

-- Show backlinks for current note
keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Obsidian Backlinks" })

-- List all links in current note
keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Obsidian Links" })

-- List tags / search by tag
keymap.set("n", "<leader>og", "<cmd>ObsidianTags<CR>", { desc = "Obsidian Tags" })

-- Table of contents for current note
keymap.set("n", "<leader>oc", "<cmd>ObsidianTOC<CR>", { desc = "Obsidian TOC" })

-- Paste image from clipboard into note
keymap.set("n", "<leader>op", "<cmd>ObsidianPasteImg<CR>", { desc = "Obsidian Paste Image" })

-- Rename note and update backlinks
keymap.set("n", "<leader>or", "<cmd>ObsidianRename<CR>", { desc = "Obsidian Rename Note" })

-- Open current note in Obsidian app
keymap.set("n", "<leader>ooa", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
