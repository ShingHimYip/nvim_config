-- import plugin safely
--https://github.com/gelguy/wilder.nvim
local status, wilder = pcall(require, "wilder")
if not status then
	return
end

-- enable plugin
wilder.setup({
	modes = { ":", "/", "?" }, -- Enable wilder in command-line and search modes
})

-- For command-line mode
vim.api.nvim_set_keymap(
	"c",
	"<Tab>",
	[[<Cmd>wilder#in_context() ? wilder#do_cmdline_completion() : "\<Tab>"<CR>]],
	{ noremap = true, silent = true, expr = true }
)

-- For search mode (forward search)
vim.api.nvim_set_keymap(
	"n",
	"/<Tab>",
	[[<Cmd>wilder#in_context() ? wilder#do_search_completion('forward') : "/<Tab>"<CR>]],
	{ noremap = true, silent = true, expr = true }
)

-- For search mode (backward search)
vim.api.nvim_set_keymap(
	"n",
	"?<S-Tab>",
	[[<Cmd>wilder#in_context() ? wilder#do_search_completion('backward') : "?<S-Tab>"<CR>]],
	{ noremap = true, silent = true, expr = true }
)
