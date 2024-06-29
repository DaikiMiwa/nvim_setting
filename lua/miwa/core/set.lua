-- Function to detect if a virtual environment is active and return its Python path
local function get_home_virtual_env()
	local home = os.getenv("HOME")
	if home then
		return home .. "/.local/venv" .. "neovim" .. "/bin/python"
	else
		return nil
	end
end

local function get_python_virtual_env()
	local venv = os.getenv("VIRTUAL_ENV")
	if venv then
		return venv .. "/bin/python"
	else
		return get_home_virtual_env()
	end
end
-- Function to check if pynvim is installed and install it if not
local function ensure_pynvim_installed(python_bin)
	local handle = io.popen(python_bin .. " -m pip show pynvim")
	local result = handle:read("*a")
	handle:close()

	if result == "" then
		print("pynvim not found, installing...")
		os.execute(python_bin .. " -m pip install pynvim")
	else
		-- print("pynvim is already installed")
	end
end

-- Set the Python3 host program to the virtual environment's Python if it is active
local python3_host_prog = get_python_virtual_env()
-- print(python3_host_prog)
if python3_host_prog then
	vim.g.python3_host_prog = python3_host_prog
	ensure_pynvim_installed(python3_host_prog)
end
