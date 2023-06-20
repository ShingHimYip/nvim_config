local venv_python_path

if jit.os == "Windows" then
	venv_python_path = os.getenv("VIRTUAL_ENV") and os.getenv("VIRTUAL_ENV") .. "\\Scripts\\python.exe" or "python"
else
	venv_python_path = os.getenv("VIRTUAL_ENV") and os.getenv("VIRTUAL_ENV") .. "/bin/python" or "/usr/bin/python3"
end

local f = io.open(venv_python_path, "r")
if f ~= nil then
	io.close(f)
	vim.g.python3_host_prog = venv_python_path
end
