-- Import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- Configure treesitter
treesitter.setup({
	-- Enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- Enable indentation
	indent = { enable = true },
	-- Enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- Enable folding
	fold = {
		enable = true,
		disable = { "c", "ruby" }, -- You can customize this list based on which languages you don't want folding for
	},
	-- Ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"python",
		"c_sharp",
	},
	-- Auto install above language parsers
	auto_install = true,
})

-- -- Disable auto folding when starting nvim
-- vim.wo.foldenable = false
--
-- -- Set folding to use Treesitter
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
--
-- -- Custom function to fold based on Treesitter nodes for TypeScript
-- vim.cmd([[
-- function! FoldFunctionUnderCursorTS()
--     " Use Treesitter to get the current node under the cursor
--     let l:node = nvim_get_node_at_cursor()
--     " Assuming 'function_identifier' as the node name for function names in TypeScript
--     " Adjust if this is not correct!
--     if !empty(l:node) && l:node:type() == 'function_identifier'
--         " Fold the function if the cursor is on a function name in TypeScript
--         normal! zf%
--     endif
-- endfunction
-- ]])
--
-- -- Bind the command to zf
-- vim.api.nvim_set_keymap("n", "zf", ":call FoldFunctionUnderCursorTS()<CR>", { noremap = true, silent = true })
