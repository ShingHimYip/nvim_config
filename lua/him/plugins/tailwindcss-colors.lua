-- import plugin safely
local status, tailwindcss = pcall(require, "tailwindcss-colors")
if not status then
	return
end

-- enable comment
tailwindcss.setup()
