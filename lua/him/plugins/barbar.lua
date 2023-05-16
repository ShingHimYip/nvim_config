-- import comment plugin safely
local setup, _ = pcall(require, "barbar")
if not setup then
	return
end

vim.keymap.set("n", "<c-n>", "<cmd>BufferNext<CR>")
vim.keymap.set("n", "<c-m>", "<cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<c-x>", "<cmd>BufferClose<CR>")
