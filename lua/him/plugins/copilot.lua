-- import comment plugin safely
local setup, _ = pcall(require, "Copilot")
if not setup then
	return
end
