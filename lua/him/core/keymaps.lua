-- set leader key to space
vim.g.mapleader = " "

-- Unmap the original behavior of H and L in normal mode
vim.keymap.set("n", "H", "<nop>")
vim.keymap.set("n", "L", "<nop>")

vim.keymap.set("v", "H", "<nop>")
vim.keymap.set("v", "L", "<nop>")

-- Unmap original split navigation behavior
vim.keymap.set("n", "<C-w>h", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>j", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>k", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>l", "<nop>", { noremap = true, silent = true })

---------------------
-- General Keymaps
---------------------

-- vim.keymap.set("n", "<leader>t", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up

--Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

--Delete a word backword
vim.keymap.set("n", "dw", 'vb"_d')

--go back using shift w
vim.keymap.set("n", "W", "b")

-- Map H to the beginning of the line and L to the end of the line in normal mode
vim.keymap.set("n", "H", "^") -- Move to the beginning of the line
vim.keymap.set("n", "L", "$") -- Move to the end of the line
vim.keymap.set("v", "H", "^") -- Move to the beginning of the line
vim.keymap.set("v", "L", "$") -- Move to the end of the line

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
-- vim.keymap.set("n", "<c-w>h", "<c-w>s") -- horizontal split window
vim.keymap.set("n", "<c-w>x", ":close<CR>") -- close current split window
vim.keymap.set("n", "<c-w>m", ":MaximizerToggle<CR>") -- toggle split window maximization

local function setup_windows_split_resizing()
	-- Check if the OS is Windows
	local os_info = vim.loop.os_uname()
	if os_info.sysname == "Windows_NT" then
		-- Map <C-w> + HJKL for split resizing
		vim.keymap.set("n", "<C-w>h", ":vertical resize -5<CR>", { noremap = true, silent = true }) -- Reduce window width by 5 columns
		vim.keymap.set("n", "<C-w>l", ":vertical resize +5<CR>", { noremap = true, silent = true }) -- Increase window width by 5 columns
		vim.keymap.set("n", "<C-w>j", ":resize +5<CR>", { noremap = true, silent = true }) -- Increase window height by 5 rows
		vim.keymap.set("n", "<C-w>k", ":resize -5<CR>", { noremap = true, silent = true }) -- Reduce window height by 5 rows
	end
end

-- Call the function to set up the mappings
setup_windows_split_resizing()

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

-- set G to the last
vim.keymap.set("n", "G", "G$")

--temp
vim.keymap.set("n", "<leader>ws", ":w<bar>:so<CR>")
vim.keymap.set("n", "<leader>ff", ":lua vim.lsp.buf.format()<CR>")
-- vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>") -- got to declaration
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation) -- go to implementation

-- print("run in keymaps")
