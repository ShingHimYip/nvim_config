-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local keymap = vim.keymap -- for conciseness

-- restart lsp server (not on youtube nvim video)
vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- Show LSP methods search results
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts) -- jump directly to definition
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gi", "<cmd>Lspsaga finder imp<CR>", opts) -- Search and preview implementation of interfaces
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
		keymap.set("v", "<leader>js", [[cJSON.stringify(<c-r>")<esc>]], { noremap = true, silent = true }) -- stringify json
		keymap.set("v", "<leader>cl", [[<esc>`>a)<esc>`<iconsole.log(<esc>]], { noremap = true, silent = true }) -- console.log selected text
		keymap.set("v", "<leader>ld", [[<esc>`>a)<esc>`<ilogger.debug(<esc>]], { noremap = true, silent = true }) -- logger.debug selected text
		keymap.set("v", "<leader>tld", [[<esc>`>a)<esc>`<ithis.logger.debug(<esc>]], { noremap = true, silent = true }) -- this.logger.debug selected text
	end

	if client.name == "pyright" then
		local cwd = vim.fn.getcwd()
		if vim.fn.glob(cwd .. "/venv") ~= "" then
			client.config.settings.python.pythonPath = cwd .. "/venv/bin/python"
		elseif vim.fn.glob(cwd .. "/.venv") ~= "" then
			client.config.settings.python.pythonPath = cwd .. "/.venv/bin/python"
		else
			client.config.settings.python.pythonPath = "/usr/bin/python3"
		end
	end

	if client.name == "tailwindcss" then
		require("tailwindcss-colors").buf_attach(bufnr)
	end

	if client.name == "pyright" then
		vim.keymap.set("n", "<Leader>ii", "<cmd>PyrightOrganizeImports<CR>")
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = "", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = function()
		return vim.fn.getcwd()
	end,
	filetypes = { "python" },
	settings = {
		pyright = {
			disableOrganizeImports = false,
			analysis = {
				useLibraryCodeForTypes = true,
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				autoImportCompletions = true,
			},
		},
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
			venvPath = vim.fn.getcwd(),
			pythonPath = vim.fn.getcwd(),
			venv = ".venv",
		},
	},

	-- python lsp
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- configure omnisharp server for C#
lspconfig["omnisharp"].setup({
	cmd = {
		"C:\\Users\\SHY01\\AppData\\Local\\nvim-data\\mason\\packages\\omnisharp\\omnisharp.cmd",
		"--languageserver",
	},
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern(".git", "solution.sln", "project.csproj"),
	filetypes = { "cs" },
})

-- keymaps
