local M = {}
print("darkvoid config loaded") -- test

function M.setup(user_config)
	require("darkvoid.colorscheme").setup(user_config)
end

return M
