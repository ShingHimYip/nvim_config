vim.o.updatetime = 250

-- Attach custom highlights to diagnostics
vim.diagnostic.config({
	severity_sort = true,
	underline = true,
	virtual_text = false,
	signs = true,
	update_in_insert = false,
	highlights = nil,
})

-- Define custom sign for error lines
vim.fn.sign_define("LspDiagnosticsLineError", { text = "", linehl = "LspDiagnosticsLineErrorHighlight" })
vim.cmd("highlight LspDiagnosticsLineErrorHighlight guibg=#8B0000")

-- Define custom sign for warning lines
vim.fn.sign_define("LspDiagnosticsLineWarning", { text = "", linehl = "LspDiagnosticsLineWarningHighlight" })
vim.cmd("highlight LspDiagnosticsLineWarningHighlight guibg=#a3981d")

function ApplyDiagnosticSigns()
	local bufnr = vim.api.nvim_get_current_buf()
	local diagnostics = vim.diagnostic.get(bufnr)

	-- Remove existing signs
	vim.fn.sign_unplace("LspDiagnostics", { buffer = bufnr })

	-- Place new signs
	for _, diagnostic in ipairs(diagnostics) do
		local sign_name = nil
		if diagnostic.severity == vim.diagnostic.severity.ERROR then
			sign_name = "LspDiagnosticsLineError"
		elseif diagnostic.severity == vim.diagnostic.severity.WARN then
			sign_name = "LspDiagnosticsLineWarning"
		end

		if sign_name then
			vim.fn.sign_place(0, "LspDiagnostics", sign_name, bufnr, { lnum = diagnostic.lnum + 1 })
		end
	end
end

-- Use CursorHold and CursorHoldI events as triggers for applying diagnostic signs
vim.cmd("autocmd CursorHold,CursorHoldI * lua ApplyDiagnosticSigns()")

-- Use CursorHold event to display diagnostic popup window
function CustomDiagnosticFormat(diagnostic)
	return string.format("%s (%s)", diagnostic.message, diagnostic.source)
end

vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float({ format = CustomDiagnosticFormat }, {focus=false})]])
