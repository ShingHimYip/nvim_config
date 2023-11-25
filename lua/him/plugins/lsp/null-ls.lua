-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		--  to disable file types use
		--  "formatting.prettier.with({disabled_filetypes = {}})" (see null-ls docs)

		-- add formatter under here --------
		formatting.prettier, -- js/ts formatter
		formatting.stylua, -- lua formatter
		formatting.autopep8, -- python formatter
		------------------------------------------

		-- add linter under here ------------
		diagnostics.eslint_d.with({ -- js/ts linter
			-- only enable eslint if root has .eslintrc.js or .eslintrc.json (not in youtube nvim video)
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js") or utils.root_has_file(".eslintrc.json") -- change file extension if you use something else
			end,
		}),
		diagnostics.pylint.with({
			-- extra_args = {
			-- 	"--load-plugins",
			-- 	-- "pylint_django" , -- only need if u use django
			-- },
			env = {
				["PYTHONPATH"] = vim.fn.expand("%:p:h") .. "/venv/lib/python3.9/site-packages",
			},
		}),
		diagnostics.djlint,
		------------------------------------------
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		-- Specify files to exclude from formatting
		local excluded_files = {
			-- "tailwind.config.js", -- Replace with your file name
		}

		-- Function to check if the current file is excluded
		local function is_excluded_file()
			local file_name = vim.fn.expand("%:t") -- Get the current file name
			for _, excluded_file in ipairs(excluded_files) do
				if file_name == excluded_file then
					return true
				end
			end
			return false
		end

		-- Set up auto-formatting unless the file is excluded
		if current_client.supports_method("textDocument/formatting") and not is_excluded_file() then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							-- only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
