local M = {}

function M.setup(user_config)
	require("darkvoid.colorscheme").setup(user_config)
	vim.cmd.colorscheme("darkvoid")
end

return M
