-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

-- import telescope actions safely
local buildtin_setup, builtin = pcall(require, "telescope.builtin")
if not actions_setup then
	return
end

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local fb_actions = telescope.extensions.file_browser.actions
telescope.load_extension("fzf")

-- configure telescope
telescope.setup({
	defaults = {
		file_ignore_patterns = {
			".git/",
			"^./.git/",
			"%.svg",
			"node_modules/*",
			"node_modules",
			"^node_modules/",
			"venv",
			".venv",
			"__pycache__",
		},
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
			},
			n = {
				["<C-c>"] = actions.close,

				-- file browser remap
				["-"] = fb_actions.goto_parent_dir,
			},
		},
	},
})

vim.keymap.set("n", ";f", function()
	builtin.find_files({})
end)
vim.keymap.set("n", ";r", function()
	builtin.live_grep({})
end)

vim.keymap.set("n", ";j", function()
	builtin.registers({
		previewer = false,
		initial_mode = "normal",
	})
end)

vim.keymap.set("n", ";b", function()
	builtin.buffers({
		previewer = false,
		initial_mode = "normal",
	})
end)
vim.keymap.set("n", "<leader>g", function()
	builtin.help_tags()
end)
vim.keymap.set("n", ";d", function()
	builtin.diagnostics()
end)
vim.keymap.set("n", ";;", function()
	builtin.resume()
end)

-- vim.keymap.set("n", "<leader>ps", function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)

vim.keymap.set("n", ";gfs", builtin.git_files, {})
vim.keymap.set("n", ";gc", builtin.git_commits, {}) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
vim.keymap.set("n", ";gfc", builtin.git_bcommits, {}) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
vim.keymap.set("n", ";gb", builtin.git_branches, {}) -- list git branches (use <cr> to checkout) ["gb" for git branch]
vim.keymap.set("n", ";gs", builtin.git_status, {}) -- list current changes per file with diff preview ["gs" for git status]

vim.keymap.set("n", ";e", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		-- layout_config = { height = 30, width = 80 },
	})
end)
