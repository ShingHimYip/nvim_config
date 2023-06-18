-- import comment plugin safely
local setup, _ = pcall(require, "magma-nvim")
if not setup then
	return print("not working")
end
