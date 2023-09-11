-- import comment plugin safely
-- local setup, _ = pcall(require, "magma-nvim")
-- print("under the setup line")
--
-- if not setup then
-- 	return print("magma not working")
-- end

if packer_plugins["magma-nvim"] and packer_plugins["magma-nvim"] then
	print("Loaded magma-nvim")
end
