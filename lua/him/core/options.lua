function os_based_settings()
	-- get operating system name
	local os_name = vim.loop.os_uname().sysname

	-- check if OS is Windows
	if os_name == "Windows_NT" then
		-- Windows-specific settings
		vim.opt.undodir = os.getenv("USERPROFILE") .. "\\.vim\\undodir"
	else
		-- Linux and MacOS settings
		vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
	end
end

os_based_settings()

local opt = vim.opt

opt.relativenumber = true -- show relative line numbers
opt.nu = true -- shows absolute line number on cursor line (when relative number is on)

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undofile = true

opt.ignorecase = true
opt.hlsearch = true -- do not highlight search
opt.incsearch = true -- incremental search
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.updatetime = 50
opt.colorcolumn = "120"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- spellcheck
-- opt.spell = true
-- opt.spelllang = "en_gb,cjk"
-- opt.spelloptions = "camel"
