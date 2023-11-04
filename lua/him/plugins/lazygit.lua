local setup, _ = pcall(require, "lazygit")
if not setup then
	return
end

vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>")
