local status, mark = pcall(require, "harpoon.mark")
if not status then
	return
end

local ui_status, ui = pcall(require, "harpoon.ui")
if not status then
	return
end

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", ";h", ui.toggle_quick_menu)

vim.keymap.set("n", ";1", function()
	ui.nav_file(1)
end)

vim.keymap.set("n", ";2", function()
	ui.nav_file(2)
end)

vim.keymap.set("n", ";3", function()
	ui.nav_file(3)
end)

vim.keymap.set("n", ";4", function()
	ui.nav_file(4)
end)

vim.keymap.set("n", ";5", function()
	ui.nav_file(5)
end)
