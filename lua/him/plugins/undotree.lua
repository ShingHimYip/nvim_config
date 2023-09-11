-- import comment plugin safely
-- local setup, _ = pcall(require, "undotree")
-- if not setup then
-- 	print("Failed to load undotree: " .. tostring(_))
-- 	return
-- end

if packer_plugins["undotree"] and packer_plugins["undotree"] then
	vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
end
