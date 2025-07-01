vim.g.mapleader = " "

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

-- keymaps for switching windows


-- plugin keymaps 
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- tree toggle
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- minimap toggle 
keymap.set("n", "<leader>mmt", ":MinimapToggle<CR>")
keymap.set("n", "<leader>mmc", ":MinimapClose<CR>")


-- telescope 
--
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")


-- Calendar
keymap.set("n", "<leader>clo", ":Calendar -view=clock<CR>")
keymap.set("n", "<leader>cal", ":Calendar<CR>")


-- Obsidian
vim.keymap.set("n", "<leader>oc", "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", { desc = "Obsidian Check Checkbox" })
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" })
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })
vim.keymap.set("n", "<leader>of", "<cmd>ObsidianFollowLink [vsplit|hsplit]<CR>", { desc = "Follow link" })
-- vim.keymap.set("n", "<leader>ov", "<cmd>ObsidianFollowLink vsplit<CR>", { desc = "Follow link" })
-- :ObsidianFollowLink [vsplit|hsplit]


-- FML
keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- Terminal
keymap.set("n", "<leader>cm", ":ToggleTerm<CR>")

