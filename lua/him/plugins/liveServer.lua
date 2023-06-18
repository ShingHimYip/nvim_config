-- import gitsigns plugin safely
local setup, liveServer = pcall(require, "live-server")
if not setup then
	return
end

-- configure/enable gitsigns
liveServer.setup()
