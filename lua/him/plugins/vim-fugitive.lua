-- import comment plugin safely
local setup, _ = pcall(require, "vim-fugitive")
if not setup then
	return
end

-- keymaps

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gj", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "<leader>gf", "<cmd>diffget //3<CR>")
