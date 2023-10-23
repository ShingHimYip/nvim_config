-- Import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	-- Keybinds for navigation in lspsaga window
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },

	-- Use enter to open file with definition preview
	definition = {
		edit = "o",
	},

	ui = {
		colors = {
			normal_bg = "#022746",
		},
	},

	-- Implement configuration
	implement = {
		enable = true,
		sign = true,
		virtual_text = true,
		priority = 100,
	},
})
