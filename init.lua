--install plug in :
require("him.plugins-setup")

-- core file :
require("him.core.options")
require("him.core.keymaps")
require("him.core.colorscheme")

-- plugin setting :
require("him.plugins.comment")
require("him.plugins.lualine")
require("him.plugins.telescope")
require("him.plugins.nvim-cmp")

--lsp setting :
require("him.plugins.lsp.mason")
require("him.plugins.lsp.lspsaga")
require("him.plugins.lsp.lspconfig")
require("him.plugins.lsp.null-ls")

require("him.plugins.autopairs")
require("him.plugins.treesitter")
require("him.plugins.gitsigns")
require("him.plugins.colorizer")
require("him.plugins.zen-mode")
require("him.plugins.harpoon")
require("him.plugins.todo-comments")

-- print("hi init.lua")
