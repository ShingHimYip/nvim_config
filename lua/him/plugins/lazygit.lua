local setup, _ = pcall(require, "lazygit")
if not setup then
	return
end

vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>")

-- NOTE: The following is the setting that u need to put into the .gitconfig

--[merge]
--   tool = nvim
-- [mergetool "nvim"]
--   cmd = nvim -f -c "Gvdiffsplit!" "$MERGED"
-- [mergetool]
--   prompt = false

-- NOTE: The following is the config.yml for the lazygit

--os:
--   editPreset: "nvim-remote"
--   edit: "nvim {{filename}}"
--
-- git:
--   merging:
--     manualMergeCommand: 'nvim -f -c "Gvdiffsplit!" "$MERGED"'
--
