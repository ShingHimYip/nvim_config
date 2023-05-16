-- import comment plugin safely
local setup, _ = pcall(require, "undotree")
if not setup then
	return
end

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
