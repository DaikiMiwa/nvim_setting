return {
	"jupyter-vim/jupyter-vim",
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>rc", ":JupyterConnect<CR>", {})
		keymap.set("n", "<leader>rr", ":JupyterRunFile<CR>", {})
		keymap.set("n", "<leader>ri", ":PythonImportThisFile<CR>", {})
		keymap.set("n", "<leader>rd", ":JupyterCd %:p:h<CR>", {})
		keymap.set("n", "<leader>re", ":JupyterSendCell<CR>", {})
		keymap.set("v", "<leader>re", ":JupyterSendRange<CR>", {})
		keymap.set("n", "<leader>rb", ":PythonSetBreak<CR>", {})
		keymap.set("n", "<leader>aa", "o# %%<ESC>", {})
	end,
}
