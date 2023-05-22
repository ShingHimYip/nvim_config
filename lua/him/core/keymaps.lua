-- set leader key to space
vim.g.mapleader = " "

---------------------
-- General Keymaps
---------------------

vim.keymap.set("n", "<leader>t", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up

--Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

--Delete a word backword
vim.keymap.set("n", "dw", 'vb"_d')

--go back using shift w
vim.keymap.set("n", "W", "b")

--Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

vim.keymap.set("n", "J", "mzJ`z") -- maintain cursor position when condensing lines
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- remain cursor in the middle when page down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- remain cursor in the middle when page up
vim.keymap.set("n", "n", "nzzzv") -- remain cursor in the middle when navigating down search result
vim.keymap.set("n", "N", "Nzzzv") -- remain cursor in the middle when navigating up search result

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y') -- yank content to system clipboard
vim.keymap.set("n", "<leader>Y", '"+Y') -- yank the entire line to system clipboard

vim.keymap.set({ "n", "v" }, "d", '"_d')
vim.keymap.set({ "n", "v" }, "yd", "d")
vim.keymap.set({ "n", "v" }, "c", '"_c')
vim.keymap.set({ "n", "v" }, "yc", "c")
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set({ "n", "v" }, "yx", "x")
vim.keymap.set({ "n", "v" }, "s", '"_s')
vim.keymap.set({ "n", "v" }, "ys", "s")

vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "Q", "<nop>") -- do nothing when pressing 'Q'

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<c-k>", "<cmd>cnext<cr>zz")
vim.keymap.set("n", "<c-j>", "<cmd>cprev<cr>zz")
vim.keymap.set("n", "<leader>k", "<cmd>cnext<cr>zz")
vim.keymap.set("n", "<leader>j", "<cmd>cprev<cr>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- find current word and replace

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

-- window management
vim.keymap.set("n", "<c-w>h", "<c-w>s") -- horizontal split window
vim.keymap.set("n", "<c-w>x", ":close<CR>") -- close current split window
vim.keymap.set("n", "<c-w>m", ":MaximizerToggle<CR>") -- toggle split window maximization

-- vim-maximizer
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- reverse indent and indent
-- -- Set mappings in insert mode
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true, silent = true })
vim.keymap.set("i", "<Tab>", "<Tab>", { noremap = true, silent = true })

-- Set mappings in normal mode
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true, silent = true })
vim.keymap.set("n", "<Tab>", ">>", { noremap = true, silent = true })

-- Set mappings in visual mode
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })

----------------------
-- Plugin Keybinds
----------------------

-- telescope
-- inside the telescope.lua (him/plugins/telescope.lua)

-- undotree

-- Barbar tab management

-- Fugitive Git keymaps

-- python lsp

-- harpoon
-- inside the harpoon.lua (him/plugins/harpoon.lua)

-- Todo comment

--temp
vim.keymap.set("n", "<leader>ws", ":w<bar>:so<CR>")

-- print("run in keymaps")
