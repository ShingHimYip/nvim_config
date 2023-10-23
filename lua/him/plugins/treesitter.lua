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

-- Set Neovim's fold method to use Tree-sitter
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--
-- function ToggleFoldUnderCursor()
-- 	local parsers = require("nvim-treesitter.parsers")
-- 	local ts_utils = require("nvim-treesitter.ts_utils")
--
-- 	local bufnr = vim.api.nvim_get_current_buf()
-- 	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 	row = row - 1
--
-- 	local parser = parsers.get_parser(bufnr)
-- 	if not parser then
-- 		print("Tree-sitter parser not available for this buffer.")
-- 		return
-- 	end
--
-- 	local root = parser:parse():root()
-- 	if not root then
-- 		print("Tree-sitter has not parsed this buffer.")
-- 		return
-- 	end
--
-- 	local node = ts_utils.get_node_at_cursor()
--
-- 	if node then
-- 		local start_row, _, end_row, _ = node:range()
-- 		-- Check if the node is already folded
-- 		if vim.fn.foldclosed(start_row + 1) == -1 then
-- 			-- If not, fold it
-- 			vim.cmd(string.format("normal! %dGzv%dGzf", start_row + 1, end_row + 1))
-- 		else
-- 			-- If it's already folded, open the fold
-- 			vim.cmd(string.format("normal! %dGzo", start_row + 1))
-- 		end
-- 	end
-- end
--
-- vim.opt.foldlevelstart = 99
-- vim.api.nvim_set_keymap("n", "zf", ":lua ToggleFoldUnderCursor()<CR>", { noremap = true, silent = true })
