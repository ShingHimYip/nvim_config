-- Initialize global variable
vim.g.auto_save = false

-- Create an autocommand group AutoSave
vim.cmd([[
  augroup AutoSave
    autocmd!
    autocmd CursorHold,InsertLeave,TextChanged * if g:auto_save | silent! write | endif
  augroup END
]])

-- Create keymap to toggle auto save
vim.api.nvim_set_keymap("n", "<leader>as", ":lua ToggleAutoSave()<CR>", { noremap = true, silent = true })

-- Define the ToggleAutoSave function
_G.ToggleAutoSave = function()
	vim.g.auto_save = not vim.g.auto_save
	local msg = vim.g.auto_save and "AutoSave Enabled" or "AutoSave Disabled"
	print(msg)
end
