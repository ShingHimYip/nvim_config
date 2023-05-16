local status, obsidian = pcall(require, "obsidian")
if not status then
	return
end

obsidian.setup({
	opts = {
		dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian Vault",
	},
	completion = {
		nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
	},
	-- Optional, set to true if you use the Obsidian Advanced URI plugin.
	-- https://github.com/Vinzent03/obsidian-advanced-uri
	use_advanced_uri = true,

	-- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
	open_app_foreground = false,

	-- Optional, by default commands like `:ObsidianSearch` will attempt to use
	-- telescope.nvim, fzf-lua, and fzf.nvim (in that order), and use the
	-- first one they find. By setting this option to your preferred
	-- finder you can attempt it first. Note that if the specified finder
	-- is not installed, or if it the command does not support it, the
	-- remaining finders will be attempted in the original order.
	finder = "telescope.nvim",
})
